import 'package:flutter/material.dart';
import 'database.dart';
import 'generate.dart';

class FeedingPage extends StatelessWidget {
  final MyDatabase _db = MyDatabase();

  Future<void> _onGeneratePressed(BuildContext context) async {
    final users = await _db.getAllUsers();
    if (users.isEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => GeneratePage()),
      );
    } else {
      // 跳转到展示一日三餐的页面
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MealsPage()), // 假设你有一个 MealsPage 用于展示一日三餐
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 大图
            Image.network(
              'https://www.eatthismuch.com/app/_app/immutable/assets/orange-painting-2x.ffmmluy3.png', // 替换为实际的大图URL
              height: 300,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
            // 一行文字
            Text(
              'No meals planned yet',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            // 两个按钮，垂直排列，宽度一致
            SizedBox(
              width: 200, // 设置按钮的固定宽度
              child: ElevatedButton(
                onPressed: () => _onGeneratePressed(context),
                child: Text('Generate', style: TextStyle(fontSize: 20)),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 15),
                ),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: 200, // 设置按钮的固定宽度
              child: ElevatedButton(
                onPressed: () {
                  // Edit User Info按钮点击事件
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GeneratePage()),
                  );
                },
                child: Text('Edit User Info', style: TextStyle(fontSize: 20)),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MealsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Today\'s Meals'),
      ),
      body: Center(
        child: Text('Here will be today\'s meals.'),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: FeedingPage(),
  ));
}
