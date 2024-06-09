import 'dart:convert';
import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'FoodDetailPage.dart';
import 'database.dart'; // 确保导入你项目中的数据库

class MealsPage extends StatefulWidget {
  final DateTime? day;
  final double? eatcalories;
  const MealsPage({Key? key, this.day, this.eatcalories}) : super(key: key);

  @override
  _MealsPageState createState() => _MealsPageState();
}

class _MealsPageState extends State<MealsPage> {
  final MyDatabase _db = MyDatabase();
  late Calory calculatedValues;
  List<dynamic> meals = [];
  List<String> mealsType = ["Breakfast", "Lunch", "Dinner", "Snack"];
  List<dynamic> food_infos = [];

  @override
  void initState() {
    super.initState();
    _initMeals();
  }

  Future<void> _initMeals() async {
    final calories = await _db.getAllCaloriesEntries();
    if(calories.isNotEmpty){
      calculatedValues = calories.first;
      _fetchMeals();
    }
  }

  Future<void> _fetchMeals() async {
    DateTime now = DateTime.now();
    DateTime _selectedDate = widget.day ?? DateTime(now.year, now.month, now.day);
    // 检查数据库中是否有对应日期的记录
    List<Meal> mealsData = await _db.getMealsForDate(_selectedDate);

    if (mealsData.isNotEmpty) {
      var meal = mealsData.first;
      // 如果数据库中已经存在相应的数据，则直接使用数据库中的数据
      setState(() {
        meals = jsonDecode(meal.meals) as List;
        food_infos = jsonDecode(meal.foodInfos) as List;
      });
    } else {
      const url = "https://www.eatthismuch.com/g/generate/day-json/";
      final headers = {
        "accept": "application/json, text/javascript, */*; q=0.01",
        "accept-language": "zh-CN,zh;q=0.9",
        "content-type": "application/json; charset=UTF-8",
        "priority": "u=1, i",
        "sec-fetch-dest": "empty",
        "sec-fetch-mode": "cors",
        "sec-fetch-site": "same-origin",
        "x-csrftoken": "fgoLVboiO6B1FGWDEPXKUuQp8eUeo7rw",
        "x-requested-with": "XMLHttpRequest"
      };

      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode({
          "days": [
            {
              "num_meals": 4,
              "nutrition_profile": {
                "calories": widget.eatcalories ?? 400,
                "cholesterol": 300,
                "fiber": 25,
                "macro_scheme": "grams",
                "max_carbs": 50,
                "max_fats": 22,
                "max_proteins": 50,
                "min_carbs": 20,
                "min_fats": 9,
                "min_proteins": 20,
                "percent_carbs": 40,
                "percent_fats": 30,
                "percent_proteins": 30,
                "sodium": 2400,
                "title": "My Nutrition Targets",
                "resource_uri": -463990310
              },
              "meals": [
                {
                  "meal_number": 0,
                  "foods": [],
                  "meal_type": {
                    "title": "Breakfast",
                    "size_slider": 100,
                    "family_scale": 1,
                    "takeout": false,
                    "min_preptime": 0,
                    "max_preptime": 30,
                    "min_cooktime": 0,
                    "max_cooktime": 30,
                    "max_totaltime": 30,
                    "preferred_food_types": 1,
                    "complexity": 2,
                    "resource_uri": -217996899
                  }
                },
                {
                  "meal_number": 1,
                  "foods": [],
                  "meal_type": {
                    "title": "Lunch",
                    "size_slider": 100,
                    "family_scale": 1,
                    "takeout": false,
                    "min_preptime": 0,
                    "max_preptime": 30,
                    "min_cooktime": 0,
                    "max_cooktime": 0,
                    "max_totaltime": 30,
                    "preferred_food_types": 2,
                    "complexity": 2,
                    "resource_uri": -290269141
                  }
                },
                {
                  "meal_number": 2,
                  "foods": [],
                  "meal_type": {
                    "title": "Dinner",
                    "size_slider": 125,
                    "family_scale": 1,
                    "takeout": false,
                    "min_preptime": 0,
                    "max_preptime": 30,
                    "min_cooktime": 1,
                    "max_cooktime": 30,
                    "max_totaltime": 30,
                    "preferred_food_types": 3,
                    "complexity": 2,
                    "resource_uri": -613696679
                  }
                },
                {
                  "meal_number": 3,
                  "foods": [],
                  "meal_type": {
                    "title": "Snack",
                    "size_slider": 50,
                    "family_scale": 1,
                    "takeout": false,
                    "min_preptime": 0,
                    "max_preptime": 30,
                    "min_cooktime": 0,
                    "max_cooktime": 0,
                    "max_totaltime": 15,
                    "preferred_food_types": 4,
                    "complexity": 1,
                    "resource_uri": -142776602
                  }
                }
              ]
            }
          ],
          "swole_user": {
            "activity_level": "1.2",
            "algorithm": 2,
            "beta_user": true,
            "preset_diet": "anything",
            "units": "I",
            "complexity_level": 1,
            "generator_focus": 0,
            "timezone": "8",
            "shopping_day": 5,
            "use_partial_servings": false
          }
        }),
      );

      if (response.statusCode == 200) {
        setState(() {
          final res = jsonDecode(response.body);
          meals = res["results"][0]["meals"];
          food_infos = res["food_infos"];
        });
        _saveMealsToDatabase(_selectedDate, meals, food_infos);
      } else {
        throw Exception('Failed to load meals');
      }
    }
  }

  Future<void> _saveMealsToDatabase(DateTime date, List<dynamic> meals, List<dynamic> foodInfos) async {
    try {
      // 将餐饮数据转换为 JSON 字符串
      String mealsJson = jsonEncode(meals);
      String foodInfosJson = jsonEncode(foodInfos);

      // 创建 MealsCompanion 对象并将其插入到数据库中
      final insertedId = await _db.insertMeal(MealsCompanion(
        date: drift.Value(date),
        meals: drift.Value(mealsJson),
        foodInfos: drift.Value(foodInfosJson),
      ));

      if (insertedId != null) {
        print('Meals data saved to database with ID: $insertedId');
      } else {
        print('Failed to save meals data to database');
      }
    } catch (e) {
      print('Error saving meals data to database: $e');
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Today's Meals Plan"),
      ),
      body: meals.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
          itemCount: meals.length,
          itemBuilder: (context, index) {
            final meal = meals[index];
            double totalCalories = meal['foods'].fold(0.0, (sum, food) {
              var foodInfo = food_infos.firstWhere((item) {
                return food['food_id'] == item['id'];
              });
              return sum + foodInfo['calories'];
            });
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: Column(

                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${mealsType[index]}',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4), // 添加一点间距
                      Text(
                        '${totalCalories.toInt()} Calories', // 副标题文本
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                ...meal["foods"].map<Widget>((food) {
                  var foodInfo = food_infos.firstWhere((item) {
                    return food['food_id'] == item['id'];
                  });
                  bool hasThumbnail = foodInfo != null &&
                      foodInfo['images'] != null &&
                      foodInfo['images'].isNotEmpty &&
                      foodInfo['images'][0]['thumbnail'] != null;
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FoodDetailPage(foodId: food['food_id']),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            if (hasThumbnail)
                              Image.network(
                                'https://images.eatthismuch.com/' +
                                    foodInfo['images'][0]['thumbnail'],
                                width: 50.0,
                                height: 50.0,
                                fit: BoxFit.cover,
                              )
                            else
                              Image.network(
                                'https://images.eatthismuch.com/' +
                                    foodInfo['icon_thumbnail'],
                                width: 50.0,
                                height: 50.0,
                                fit: BoxFit.cover,
                              ),
                            SizedBox(width: 16.0),
                            // 右边的文本和卡路里信息
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    foodInfo['food_name'],
                                    style: TextStyle(fontSize: 16.0),
                                    softWrap: true,
                                    maxLines: null,
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    '${foodInfo['calories'].toInt()} cal',
                                    style: TextStyle(fontSize: 14.0, color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ],
            );
          },
        ),
    );
  }
}
