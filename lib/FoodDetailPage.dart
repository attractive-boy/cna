import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

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
            Text('Description: ${food!['description']}', style: TextStyle(fontSize: 18)),
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

  Widget _buildNutritionalInfo(Map<String, dynamic> nutrition) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Nutritional Information:',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        ...nutrition.entries.map((entry) => Card(
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          child: ListTile(
            title: Text(_capitalize(entry.key.replaceAll('_', ' ')), style: TextStyle(fontSize: 18)),
            trailing: Text(entry.value.toString(), style: TextStyle(fontSize: 18)),
          ),
        )),
      ],
    );
  }

  String _capitalize(String s) => s[0].toUpperCase() + s.substring(1);

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
            trailing: Text('\$${food!['price']}', style: TextStyle(fontSize: 18)),
          ),
        ),
        Card(
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          child: ListTile(
            title: Text('Net Carbs', style: TextStyle(fontSize: 18)),
            trailing: Text('${food!['net_carbs']} g', style: TextStyle(fontSize: 18)),
          ),
        ),
        Card(
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          child: ListTile(
            title: Text('Veggie Servings', style: TextStyle(fontSize: 18)),
            trailing: Text('${food!['veggie_servings']}', style: TextStyle(fontSize: 18)),
          ),
        ),
        Card(
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          child: ListTile(
            title: Text('Fruit Servings', style: TextStyle(fontSize: 18)),
            trailing: Text('${food!['fruit_servings']}', style: TextStyle(fontSize: 18)),
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
}
