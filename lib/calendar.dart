import 'dart:math';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import 'database.dart';
import 'meals.dart';

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  late CalendarFormat _calendarFormat;
  late DateTime _focusedDay;
  late DateTime _selectedDay;
  late TextEditingController _dateController;
  final MyDatabase _db = MyDatabase();

  @override
  void initState() {
    super.initState();
    _calendarFormat = CalendarFormat.month;
    _focusedDay = DateTime.now();
    _selectedDay = DateTime.now();
    _dateController = TextEditingController(text: _selectedDay.toString().substring(0, 10));
  }

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  Future<void> _onShowPressed(BuildContext context) async {
    final users = await _db.getAllUsers();
    if (!users.isEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MealsPage(day: _selectedDay)), // 假设你有一个 MealsPage 用于展示一日三餐
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Pick date',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _dateController,
                decoration: InputDecoration(
                  labelText: 'Enter Date (YYYY-MM-DD)',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    setState(() {
                      _selectedDay = DateTime.parse(value);
                    });
                  }
                },
              ),
              SizedBox(height: 20),
              TableCalendar(
                firstDay: DateTime.utc(2020, 1, 1),
                lastDay: DateTime.utc(2030, 12, 31),
                focusedDay: _focusedDay,
                calendarFormat: _calendarFormat,
                onFormatChanged: (format) {
                  setState(() {
                    _calendarFormat = format;
                  });
                },
                onPageChanged: (focusedDay) {
                  setState(() {
                    _focusedDay = focusedDay;
                  });
                },
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _dateController.text = _selectedDay.toString().substring(0, 10);
                    _focusedDay = focusedDay;
                  });
                },
                selectedDayPredicate: (day) {
                  return isSameDay(_selectedDay, day);
                },
                headerStyle: HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: true,
                ),
                calendarStyle: CalendarStyle(
                  todayDecoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.3),
                    shape: BoxShape.circle,
                  ),
                  selectedDecoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                  selectedTextStyle: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 20),
              // 两个按钮，垂直排列，宽度一致
              Container(
                width: double.infinity, // 占满一行
                padding: EdgeInsets.symmetric(horizontal: 20), // 添加左右间距
                child: ElevatedButton(
                  onPressed: () => _onShowPressed(context),
                  child: Text('Show Meals', style: TextStyle(fontSize: 20, color: Colors.white)),
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
      ),
    );
  }
}
