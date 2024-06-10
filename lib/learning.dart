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
  FocusNode _searchFocusNode = FocusNode();
  var foods = [];
  bool _isLoading = true;
  List<String> NutritionFocus = [];
  String selectedDish = '';
  List<String> MealTypes = [];
  List<String> Categories = [];
  double _minCalories = 0;
  double _maxCalories = 2000;
  double _minCarbs = 0;
  double _maxCarbs = 500;
  double _minProtein = 0;
  double _maxProtein = 500;
  double _minFats = 0;
  double _maxFats = 250;
  double _minFiber = 0;
  double _maxFiber = 100;
  double _minSodium = 0;
  double _maxSodium = 2000;
  double _minSugar = 0;
  double _maxSugar = 100;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _fetchData('');
    _searchFocusNode.addListener(() {
      if (!_searchFocusNode.hasFocus) {
        _filterResults();
      }
    });
  }

  @override
  void dispose() {
    _learningController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  void _filterResults() {
    String query = _learningController.text;
    String filterQuery = _buildFilterQuery(query);
    _fetchData(filterQuery);
  }

  Future<void> _fetchData(String filterQuery) async {
    setState(() {
      _isLoading = true;
    });

    String url = 'https://www.eatthismuch.com/g/search/?$filterQuery';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      String responseBody = utf8.decode(response.bodyBytes);
      List<dynamic> data = json.decode(responseBody)['objects'];
      setState(() {
        foods = data;
        _isLoading = false;
      });

    } else {
      setState(() {
        _isLoading = false;
      });
      throw Exception('Failed to load data');
    }
  }

  String _buildFilterQuery(String query) {
    Map<String, dynamic> filters = {
      'limit': 200,
      'q': query,
      'min_calories': _minCalories.toInt(),
      'max_calories': _maxCalories.toInt(),
      'min_carbs': _minCarbs.toInt(),
      'max_carbs': _maxCarbs.toInt(),
      'min_fats': _minFats.toInt(),
      'max_fats': _maxFats.toInt(),
      'min_fiber': _minFiber.toInt(),
      'max_fiber': _maxFiber.toInt(),
      'min_proteins': _minProtein.toInt(),
      'max_proteins': _maxProtein.toInt(),
      'min_sodium': _minSodium.toInt(),
      'max_sodium': _maxSodium.toInt(),
      'min_sugar': _minSugar.toInt(),
      'max_sugar': _maxSugar.toInt(),
    };

    if (Categories.isNotEmpty) {
      filters['filters'] = jsonEncode(Categories);
    }

    if (MealTypes.isNotEmpty) {
      filters['preferred_food_types'] = jsonEncode(MealTypes);
    }

    // Add dish_type only if it is not empty
    if (selectedDish.isNotEmpty) {
      filters['dish_type'] = selectedDish.split(' ')[0].toLowerCase();
    }

    List<String> queryParams = [];
    filters.forEach((key, value) {
      if (value != null && value.toString().isNotEmpty) {
        queryParams.add('$key=${Uri.encodeComponent(value.toString())}');
      }
    });

    return queryParams.join('&');
  }


  Widget _buildChip(String label, String value) {
    return FilterChip(
      label: Text(label),
      selected: MealTypes.contains(value),
      onSelected: (bool selected) {
        setState(() {
          if (selected) {
            MealTypes.add(value);
          } else {
            MealTypes.remove(value);
          }
        });
      },
    );
  }

  Widget _buildCheckBox(String value, String title) {
    return CheckboxListTile(
      title: Text(title),
      value: Categories.contains(value),
      onChanged: (bool? checked) {
        setState(() {
          if (checked!) {
            Categories.add(value);
          } else {
            Categories.remove(value);
          }
        });
      },
    );
  }

  Widget _buildRangeSlider(
      String label, double minValue, double maxValue, double min, double max) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Min: ${minValue.toInt()}'),
            Text('Max: ${maxValue.toInt()}'),
          ],
        ),
        RangeSlider(
          values: RangeValues(minValue, maxValue),
          min: min,
          max: max,
          onChanged: (RangeValues values) {
            setState(() {
              if (label == 'Calories') {
                _minCalories = values.start;
                _maxCalories = values.end;
              } else if (label == 'Carbs') {
                _minCarbs = values.start;
                _maxCarbs = values.end;
              } else if (label == 'Protein') {
                _minProtein = values.start;
                _maxProtein = values.end;
              } else if (label == 'Fats') {
                _minFats = values.start;
                _maxFats = values.end;
              } else if (label == 'Fiber') {
                _minFiber = values.start;
                _maxFiber = values.end;
              } else if (label == 'Sodium') {
                _minSodium = values.start;
                _maxSodium = values.end;
              } else if (label == 'Sugar') {
                _minSugar = values.start;
                _maxSugar = values.end;
              }
            });
          },
        ),
        SizedBox(height: 16),
      ],
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              height: 80, // Set the desired height here
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 16), // 适当调整左边距值
                    child: Text(
                      'Filters',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 16), // 适当调整右边距值
                    child: TextButton(
                      onPressed: () {
                        // Reset functionality here
                        setState(() {
                          NutritionFocus.clear();
                          selectedDish = '';
                          MealTypes.clear();
                          Categories.clear();
                          _minCalories = 0;
                          _maxCalories = 2000;
                          _minCarbs = 0;
                          _maxCarbs = 500;
                          _minProtein = 0;
                          _maxProtein = 500;
                          _minFats = 0;
                          _maxFats = 250;
                          _minFiber = 0;
                          _maxFiber = 100;
                          _minSodium = 0;
                          _maxSodium = 2000;
                          _minSugar = 0;
                          _maxSugar = 100;
                        });
                      },
                      child: Padding(
                        padding: EdgeInsets.only(top: 10),
                        child:Text(
                        'Reset',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      )
                    ),
                  ),
                ],
              ),
            ),

            // Add your filter options here
            ListTile(
              title: Text('Nutrition Focus'),

            ),
        Padding(
          padding: EdgeInsets.only(left: 16),
          child :Wrap(
              direction: Axis.horizontal, // 设置为水平方向
              spacing: 8.0,
              children: [
                FilterChip(
                  label: Text('High Protein'),
                  selected: NutritionFocus.contains('high_protein'),
                  onSelected: (bool selected) {
                    setState(() {
                      if (selected) {
                        NutritionFocus.add('high_protein');
                      } else {
                        NutritionFocus.remove('high_protein');
                      }
                    });
                  },
                ),
                FilterChip(
                  label: Text('Low Carb'),
                  selected: NutritionFocus.contains('low_carb'),
                  onSelected: (bool selected) {
                    setState(() {
                      if (selected) {
                        NutritionFocus.add('low_carb');
                      } else {
                        NutritionFocus.remove('low_carb');
                      }
                    });
                  },
                ),
                FilterChip(
                  label: Text('Low Fat'),
                  selected: NutritionFocus.contains('low_fat'),
                  onSelected: (bool selected) {
                    setState(() {
                      if (selected) {
                        NutritionFocus.add('low_fat');
                      } else {
                        NutritionFocus.remove('low_fat');
                      }
                    });
                  },
                ),
                FilterChip(
                  label: Text('High Fiber'),
                  selected: NutritionFocus.contains('high_fiber'),
                  onSelected: (bool selected) {
                    setState(() {
                      if (selected) {
                        NutritionFocus.add('high_fiber');
                      } else {
                        NutritionFocus.remove('high_fiber');
                      }
                    });
                  },
                ),
                FilterChip(
                  label: Text('Low Sodium'),
                  selected: NutritionFocus.contains('low_sodium'),
                  onSelected: (bool selected) {
                    setState(() {
                      if (selected) {
                        NutritionFocus.add('low_sodium');
                      } else {
                        NutritionFocus.remove('low_sodium');
                      }
                    });
                  },
                ),
              ],
            )
        ),
            ListTile(

              title: Text('Meal Type'),

            ),
        Row(
          children: [
            Expanded(
              child: RadioListTile(
                title: Text('Main Dish'),
                value: 'Main Dish',
                groupValue: selectedDish,
                onChanged: (value) {
                  setState(() {
                    selectedDish = value.toString();
                  });
                },
                contentPadding: EdgeInsets.zero,
              ),
            ),
            Expanded(
              child: RadioListTile(
                title: Text('Side Dish'),
                value: 'Side Dish',
                groupValue: selectedDish,
                onChanged: (value) {
                  setState(() {
                    selectedDish = value.toString();
                  });
                },
                contentPadding: EdgeInsets.zero,
              ),
            ),
    ]
    ),
            SizedBox(height: 10),
        Padding(
          padding: EdgeInsets.only(left: 16),
            child: Wrap(
              spacing: 8.0,
              children: [
                _buildChip('Breakfast', 'breakfast'),
                _buildChip('Lunch', 'lunch'),
                _buildChip('Dinner', 'dinner'),
                _buildChip('Snack', 'snack'),
                _buildChip('Dessert', 'dessert'),
              ],
            ),

        ),
            ListTile(

              title: Text('Categories'),

            ),
            Column(
              children: [
                _buildCheckBox('basic_foods', 'Foods'),
                _buildCheckBox('recipes', 'Recipes'),
                _buildCheckBox('branded_foods', 'Branded Foods'),
                _buildCheckBox('restaurant_foods', 'Restaurant Foods'),
              ],
            ),
            ListTile(

              title: Text('Nutrition per Serving'),

            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildRangeSlider('Calories', _minCalories, _maxCalories, 0, 2000),
                    _buildRangeSlider('Carbs', _minCarbs, _maxCarbs, 0, 500),
                    _buildRangeSlider('Protein', _minProtein, _maxProtein, 0, 500),
                    _buildRangeSlider('Fats', _minFats, _maxFats, 0, 250),
                    _buildRangeSlider('Fiber', _minFiber, _maxFiber, 0, 100),
                    _buildRangeSlider('Sodium', _minSodium, _maxSodium, 0, 2000),
                    _buildRangeSlider('Sugar', _minSugar, _maxSugar, 0, 100),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16, right: 16,bottom: 30),
              child: Container(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed:  () => {
                    _filterResults(),
                    Navigator.of(context).pop()// Close the drawer after fetching data
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange, // 设置背景色为主题色
                  ),
                  child: Text(
                    'Submit',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20// 设置文字颜色为白色
                    ),

                  ),
                ),
              ),
            ),

          ],
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _learningController,
                    focusNode: _searchFocusNode,
                    decoration: InputDecoration(
                      hintText: 'Searching...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.filter_list),
                  onPressed: () {
                    _scaffoldKey.currentState?.openEndDrawer();
                  },
                ),
              ],
            ),
            _isLoading
                ? Expanded(child: Center(child: CircularProgressIndicator()))
                : Expanded(
              child: ListView.builder(
                itemCount: foods.length,
                itemBuilder: (context, index) {
                  var food = foods[index];
                  var foodName = food['food_name'] ?? 'Unknown';
                  var calories = food['serving_calories'] ?? 'N/A';
                  var totalTime = food['total_time'] ?? 'N/A';
                  var imageUrl = food['images'] != null &&
                      food['images'].isNotEmpty
                      ? 'https://images.eatthismuch.com/' +
                      food['images'][0]['thumbnail']
                      : 'https://via.placeholder.com/150'; // Placeholder image

                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      leading: Image.network(imageUrl),
                      title: Text(foodName),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Calories: $calories'),
                          Text('Time: $totalTime'),
                        ],
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                FoodDetailPage(foodId: food['id']),
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
