import 'package:cna/chatbot.dart';
import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'database.dart';
import 'feeding.dart';
import 'generate.dart';
import 'learning.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database = MyDatabase();

  runApp(
    Provider<MyDatabase>(
      create: (_) => database,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Child Nutrition Assistant',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  static const List<Widget> _widgetOptions = <Widget>[
    FeedingScreen(),
    LearningScreen(),
    CalendarScreen(),
    ChatbotScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      appBar: AppBar(),
      body: orientation == Orientation.portrait
          ? buildPortraitLayout()
          : buildLandscapeLayout(),
    );
  }

  Widget buildPortraitLayout() {
    return Column(
      children: [
        Expanded(
          child: Center(
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
        ),
        BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.fastfood),
              label: 'Feeding',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'Learning',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today),
              label: 'Calendar',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: 'Chatbot',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.black,
          onTap: _onItemTapped,
        ),
      ],
    );
  }

  Widget buildLandscapeLayout() {
    return Row(
      children: [
        NavigationRail(
          destinations: const <NavigationRailDestination>[
            NavigationRailDestination(
              icon: Icon(Icons.fastfood),
              label: Text('Feeding'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.school),
              label: Text('Learning'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.calendar_today),
              label: Text('Calendar'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.chat),
              label: Text('Chatbot'),
            ),
          ],
          selectedIndex: _selectedIndex,
          onDestinationSelected: _onItemTapped,
          selectedLabelTextStyle: const TextStyle(color: Colors.blue),
          selectedIconTheme: const IconThemeData(color: Colors.blue),
        ),
        const VerticalDivider(thickness: 1, width: 1),
        Expanded(
          child: Center(
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
        ),
      ],
    );
  }
}
class FeedingScreen extends StatelessWidget {
  const FeedingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child:  FeedingPage(),
    );
  }
}

class LearningScreen extends StatelessWidget {
  const LearningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: LearningPage(),
    );
  }
}

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Calendar Module'),
    );
  }
}

class ChatbotScreen extends StatelessWidget {
  const ChatbotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: ChatPage());
  }
}
