import 'dart:math';
import 'package:flutter/material.dart';
import 'database.dart';
import 'generate.dart';
import 'meals.dart';

class FeedingPage extends StatefulWidget {
  @override
  _FeedingPageState createState() => _FeedingPageState();
}

class _FeedingPageState extends State<FeedingPage> {
  final MyDatabase _db = MyDatabase();
  List<Calory>? _caloriesList;

  @override
  void initState() {
    super.initState();
    _fetchCaloriesList();
  }

  Future<void> _fetchCaloriesList() async {
    final calories = await _db.getAllCaloriesEntries();
    setState(() {
      _caloriesList = calories;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _caloriesList != null && _caloriesList!.isNotEmpty
            ? _buildCaloriesList()
            : _buildNoMealsPlanned(),
      ),
    );
  }

  Widget _buildCaloriesList() {
    return ListView.builder(
      itemCount: _caloriesList!.length,
      itemBuilder: (context, index) {
        final item = _caloriesList![index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
                child: Text(
              'Ready to give it a shot?\nLet us know your diet.', // 标题
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            )),

            SizedBox(height: 20), // 添加一些间距
            Card(
              elevation: 4,
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Recommended Nutrient Intake', // 推荐摄入的营养
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        _buildColorBall(0), // 使用不同颜色的小球
                        SizedBox(width: 12),
                        Text(
                          'Calories: ${item.calories.toInt()}',
                          style: TextStyle(fontSize: 22),
                        ),
                      ],
                    ),
                    SizedBox(height: 12), // 调整和标签之间的间距
                    Row(
                      children: [
                        _buildColorBall(1), // 使用不同颜色的小球
                        SizedBox(width: 12),
                        Text(
                          'Carbs: ${item.minCarbs}g',
                          style: TextStyle(fontSize: 22),
                        ),
                      ],
                    ),
                    SizedBox(height: 12), // 调整和标签之间的间距
                    Row(
                      children: [
                        _buildColorBall(2), // 使用不同颜色的小球
                        SizedBox(width: 12),
                        Text(
                          'Fats: ${item.minFats}g',
                          style: TextStyle(fontSize: 22),
                        ),
                      ],
                    ),
                    SizedBox(height: 12), // 调整和标签之间的间距
                    Row(
                      children: [
                        _buildColorBall(3), // 使用不同颜色的小球
                        SizedBox(width: 12),
                        Text(
                          'Proteins: ${item.minProteins}g',
                          style: TextStyle(fontSize: 22),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20), // 添加一些间距
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'I Want to Eat', // 标题
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10), // 添加间距
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: 'Enter calories',
                            border: OutlineInputBorder(),
                            suffixText: 'cal', // 添加单位
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20), // 添加一些间距
                  Container(
                    width: double.infinity, // 占满一行
                    child: ElevatedButton(
                      onPressed: () => _onGeneratePressed(context),
                      child: Text('Generate', style: TextStyle(fontSize: 20, color: Colors.white)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange, // 主题色背景
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8), // 圆角
                        ),
                        padding: EdgeInsets.symmetric(vertical: 15),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),

                  Container(
                    width: double.infinity, // 占满一行
                    child: ElevatedButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => GeneratePage()),
                      ),
                      child: Text('Edit User Info', style: TextStyle(fontSize: 20, color: Colors.white)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange, // 主题色背景
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8), // 圆角
                        ),
                        padding: EdgeInsets.symmetric(vertical: 15),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildColorBall(int index) {
    final colors = [
      Colors.red,
      Colors.blue,
      Colors.green,
      Colors.yellow,
    ];
    final colorIndex = index % colors.length;
    return Container(
      width: 20,
      height: 20,
      margin: EdgeInsets.only(right: 10), // 添加一些右侧间距
      decoration: BoxDecoration(
        color: colors[colorIndex],
        shape: BoxShape.circle,
      ),
    );
  }

  Widget _buildNoMealsPlanned() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.network(
          'https://www.eatthismuch.com/app/_app/immutable/assets/orange-painting-2x.ffmmluy3.png',
          height: 300,
          fit: BoxFit.cover,
        ),
        SizedBox(height: 20),
        Text(
          'No meals planned yet',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),

        SizedBox(height: 20),

        Container(
          width: double.infinity, // 占满一行
          padding: EdgeInsets.symmetric(horizontal: 20), // 添加左右间距
          child: ElevatedButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => GeneratePage()),
            ),
            child: Text('Edit User Info', style: TextStyle(fontSize: 20, color: Colors.white)),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange, // 主题色背景
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8), // 圆角
              ),
              padding: EdgeInsets.symmetric(vertical: 15),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _onGeneratePressed(BuildContext context) async {
    final users = await _db.getAllUsers();
    if (users.isEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => GeneratePage()),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MealsPage()),
      );
    }
  }
}
