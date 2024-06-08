import 'dart:convert';
import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'database.dart'; // 确保导入你项目中的数据库

class MealsPage extends StatefulWidget {
  final DateTime? day;
  const MealsPage({Key? key, this.day}) : super(key: key);
  @override
  _MealsPageState createState() => _MealsPageState();
}

class _MealsPageState extends State<MealsPage> {
  final MyDatabase _db = MyDatabase();
  UserInfoData? _userInfo;
  Map<String, dynamic> calculatedValues = {};
  List<dynamic> meals = [];
  List<String> mealsType = ["Breakfast", "Lunch", "Dinner", "Snack"];
  List<dynamic> food_infos = [];

  @override
  void initState() {
    super.initState();
    _loadUserInfo();
  }

  Future<void> _loadUserInfo() async {
    final users = await _db.getAllUsers();

    if (users.isNotEmpty) {
      setState(() {
        _userInfo = users.first;

        // 获取 wantTo 的第一个字母
        String wantToFirstLetter = _userInfo!.wantTo.substring(0, 1);

        // 构建参数并调用 calculateMacros 函数
        calculatedValues = calculateMacros(
          double.tryParse(_userInfo!.age) ?? 0,
          double.tryParse(_userInfo!.weight) ?? 0,
          (double.tryParse(_userInfo!.heightFt) ?? 0),
          _userInfo!.sex,
          wantToFirstLetter,
          double.tryParse(_userInfo!.bodyFat) ?? 0,
          1.55,
          _userInfo!.preferredDiet.toLowerCase(),
        );

        // 发起API请求获取今天的四顿饭
        _fetchMeals();
      });
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
        "sec-ch-ua": "\"Google Chrome\";v=\"125\", \"Chromium\";v=\"125\", \"Not.A/Brand\";v=\"24\"",
        "sec-ch-ua-mobile": "?1",
        "sec-ch-ua-platform": "\"Android\"",
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
                "calories": 400,
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

  static Map<String, dynamic> calculateMacros(double age, double weight,
      double height, String gender, String goal, double bodyfat,
      double activityLevel, String presetDiet) {
    double n;
    n = ((10 * (1 / 2.2046) * weight + 15.875 * height - 5 * age +
        (gender == "M" ? 5 : gender == "F" ? -161 : -78)) * activityLevel)
        .toInt()
        .toDouble();
    double minCarbs = 0;
    double minFats = 0;
    double minProteins = 0;
    bool cappedMinCalories = false;

    if (presetDiet == "atkins / ketogenic") {
      minCarbs = 0;
      minFats = 0.8 * weight;
      minProteins = 0.3 * weight;
    } else if (presetDiet == "paleo") {
      minCarbs = 0.3 * weight;
      minFats = 0.4 * weight;
      minProteins = 0.3 * weight;
    } else if (presetDiet == "mediterranean") {
      minCarbs = 0.4 * weight;
      minFats = 0.3 * weight;
      minProteins = 0.3 * weight;
    } else if (presetDiet == "zone") {
      minCarbs = 0.4 * weight;
      minFats = 0.3 * weight;
      minProteins = 0.3 * weight;
    } else if (presetDiet == "vegetarian") {
      minCarbs = 0.5 * weight;
      minFats = 0.2 * weight;
      minProteins = 0.3 * weight;
    } else if (presetDiet == "vegan") {
      minCarbs = 0.6 * weight;
      minFats = 0.2 * weight;
      minProteins = 0.2 * weight;
    }

    double calories = 4 * minCarbs + 9 * minFats + 4 * minProteins;
    double maxCarbs = (0.5 * calories / 4).ceil().toDouble();
    double maxFats = (0.5 * calories / 9).ceil().toDouble();
    double maxProteins = (0.5 * calories / 4).ceil().toDouble();

    return {
      'calories': calories,
      'min_carbs': minCarbs,
      'min_fats': minFats,
      'min_proteins': minProteins,
      'max_carbs': maxCarbs,
      'max_fats': maxFats,
      'max_proteins': maxProteins,
      'capped_min_calories': cappedMinCalories
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Today's meals"),
      ),
      body: meals.isEmpty
          ? Center(child: CircularProgressIndicator())
          : Expanded(
        child: ListView.builder(
          itemCount: meals.length,
          itemBuilder: (context, index) {
            final meal = meals[index];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '${mealsType[index]}',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
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
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        if (hasThumbnail)
                          Image.network(
                            'https://images.eatthismuch.com/' + foodInfo['images'][0]['thumbnail'],
                            width: 50.0,
                            height: 50.0,
                            fit: BoxFit.cover,
                          )
                        else
                          Image.network(
                            'https://images.eatthismuch.com/' + foodInfo['icon_thumbnail'],
                            width: 50.0,
                            height: 50.0,
                            fit: BoxFit.cover,
                          ),
                        SizedBox(width: 16.0),
                        // 右边的文本
                        Expanded(
                          child: Text(
                            foodInfo['food_name'],
                            style: TextStyle(fontSize: 16.0),
                            softWrap: true,
                            maxLines: null,
                          ),
                        ),
                        SizedBox(height: 70.0),
                      ],
                    ),
                  );
                }).toList(),
                Divider(),
              ],
            );
          },
        ),
      ),
    );
  }
}
