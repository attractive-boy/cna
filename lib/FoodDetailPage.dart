import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_echarts/flutter_echarts.dart';

class FoodDetailPage extends StatefulWidget {
  final int foodId;

  FoodDetailPage({required this.foodId});

  @override
  _FoodDetailPageState createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends State<FoodDetailPage> {
  Map<String, dynamic>? food;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchFoodDetails();
  }

  Future<void> _fetchFoodDetails() async {
    String url = 'https://www.eatthismuch.com/api/v1/food/${widget.foodId}/?HTTP_BACKEND_VERSION=16';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      setState(() {
        var result = utf8.decode(response.bodyBytes);
        food = json.decode(result)['data'];
        _isLoading = false;
      });
    } else {
      throw Exception('Failed to load food details');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isLoading ? 'Loading...' : food!['food_name']),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network('https://images.eatthismuch.com/' + food!['images'][0]['image']),
            SizedBox(height: 10),
            Text(
              food!['food_name'],
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            if (food!['description'] != null && food!['description'].trim().isNotEmpty) ...[
              Text(
                'Description: ${food!['description']}',
                style: TextStyle(fontSize: 18),
              ),
            ],
            SizedBox(height: 10),
            _buildEchart(),
            SizedBox(height: 10),
            _buildNutritionalInfo(food!['nutrition']),
            SizedBox(height: 10),
            Text(
              'Directions:',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            _buildDirections(),
            SizedBox(height: 10),
            _buildOtherInfo(),
          ],
        ),
      ),
    );
  }

  Widget _buildEchart() {
    double carbs = food!['carbs'] != null ? double.parse((food!['carbs']).toStringAsFixed(2)) : 0.00;
    double fats = food!['fats'] != null ? double.parse((food!['fats']).toStringAsFixed(2)) : 0.00;
    double proteins = food!['proteins'] != null ? double.parse((food!['proteins']).toStringAsFixed(2)) : 0.00;

    return Container(
      height: 300,
      child: Echarts(
        option: '''
          {
            tooltip: {
              trigger: 'item'
            },
            legend: {
              top: '5%',
              left: 'center'
            },
            series: [
              {
                name: 'Nutrients',
                type: 'pie',
                radius: ['40%', '70%'],
                avoidLabelOverlap: false,
                itemStyle: {
                  borderRadius: 10,
                  borderColor: '#fff',
                  borderWidth: 2
                },
                label: {
                  show: false,
                  position: 'center'
                },
                emphasis: {
                  label: {
                    show: true,
                    fontSize: '40',
                    fontWeight: 'bold'
                  }
                },
                labelLine: {
                  show: false
                },
                data: [
                  { value: $carbs, name: 'Carbs' },
                  { value: $fats, name: 'Fats' },
                  { value: $proteins, name: 'Proteins' }
                ]
              }
            ]
          }
        ''',
      ),
    );
  }
  Widget _buildNutritionalInfo(Map<String, dynamic> nutrition) {
    Map<String, String> units = {
      'calories': 'kcal',
      'carbs': 'g',
      'fats': 'g',
      'proteins': 'g',
      'fiber': 'g',
      'sodium': 'mg',
      'cholesterol': 'mg',
      'sugar': 'g',
      'trans_fats': 'g',
      'saturated_fats': 'g',
      'monounsaturated_fats': 'g',
      'polyunsaturated_fats': 'g',
      // Add more units for other nutritional elements if needed
    };

    List<String> keysToExclude = [
      'id',
      'resource_uri',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: nutrition.entries
          .where((entry) => !keysToExclude.contains(entry.key))
          .map((entry) {
        String key = entry.key.replaceAll('_', ' ');
        String unit = units[entry.key] ?? '';
        String value = entry.value is double
            ? entry.value.toStringAsFixed(2)
            : entry.value.toString();
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _capitalize(key),
                style: TextStyle(fontSize: 18),
              ),
              Text(
                '$value $unit',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildDirections() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var direction in food!['directions'])
          Card(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              title: Text('Step ${direction['order'] + 1}', style: TextStyle(fontSize: 18)),
              subtitle: Text(direction['text'], style: TextStyle(fontSize: 18)),
            ),
          ),
      ],
    );
  }

  Widget _buildOtherInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Other Information:',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Card(
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          child: ListTile(
            title: Text('Price', style: TextStyle(fontSize: 18)),
            trailing: Text('\$${food!['price'].toStringAsFixed(2)}', style: TextStyle(fontSize: 18)),
          ),
        ),
        Card(
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          child: ListTile(
            title: Text('Net Carbs', style: TextStyle(fontSize: 18)),
            trailing: Text('${food!['net_carbs'].toStringAsFixed(4)} g', style: TextStyle(fontSize: 18)),
          ),
        ),
        Card(
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          child: ListTile(
            title: Text('Veggie Servings', style: TextStyle(fontSize: 18)),
            trailing: Text('${food!['veggie_servings'].toStringAsFixed(4)}', style: TextStyle(fontSize: 18)),
          ),
        ),
        Card(
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          child: ListTile(
            title: Text('Fruit Servings', style: TextStyle(fontSize: 18)),
            trailing: Text('${food!['fruit_servings'].toStringAsFixed(4)}', style: TextStyle(fontSize: 18)),
          ),
        ),
        Card(
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          child: ListTile(
            title: Text('Prep Time', style: TextStyle(fontSize: 18)),
            trailing: Text('${food!['prep_time']} minutes', style: TextStyle(fontSize: 18)),
          ),
        ),
        Card(
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          child: ListTile(
            title: Text('Cook Time', style: TextStyle(fontSize: 18)),
            trailing: Text('${food!['cook_time']} minutes', style: TextStyle(fontSize: 18)),
          ),
        ),
        Card(
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          child: ListTile(
            title: Text('Total Time', style: TextStyle(fontSize: 18)),
            trailing: Text('${food!['total_time']} minutes', style: TextStyle(fontSize: 18)),
          ),
        ),
        // Add more cards for other information
      ],
    );
  }

  String _capitalize(String s) => s[0].toUpperCase() + s.substring(1);
}
