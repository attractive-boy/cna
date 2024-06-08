import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'FoodDetailPage.dart';

class LearningPage extends StatefulWidget {
  @override
  _LearningPageState createState() => _LearningPageState();
}

class _LearningPageState extends State<LearningPage> {
  TextEditingController _learningController = TextEditingController();
  var foods = [];
  bool _isLoading = true;


  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    String url = 'https://www.eatthismuch.com/g/search/?limit=200';
    final response = await http.get(
      Uri.parse(url)
    );

    if (response.statusCode == 200) {
      String responseBody = utf8.decode(response.bodyBytes);
      List<dynamic> data = json.decode(responseBody)['objects'];
      setState(() {
        foods = data;
        _isLoading = false;
      });
    } else {
      // 如果服务器返回一个错误
      throw Exception('Failed to load data');
    }
  }

  void _filterResults() {
    // 实现筛选逻辑

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _learningController,
                    decoration: InputDecoration(
                      hintText: 'Searching...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.filter_list),
                  onPressed: _filterResults,
                ),
              ],
            ),
            _isLoading
                ? Expanded(child: Center(child: CircularProgressIndicator()))
                : Expanded(
              child: ListView.builder(
                itemCount: foods.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      leading: Image.network('https://images.eatthismuch.com/' + foods[index]['images'][0]['thumbnail']!),
                      title: Text(foods[index]['food_name']!),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Calories: ${foods[index]['serving_calories']}'),
                          Text('Time: ${foods[index]['total_time']}'),
                        ],
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FoodDetailPage(foodId: foods[index]['id']),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
