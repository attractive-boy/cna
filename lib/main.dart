import 'package:cna/chatbot.dart';
import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database = AppDatabase();

  runApp(
    Provider<AppDatabase>(
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
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
    checkHasChildInfo();
  }

  Future<void> checkHasChildInfo() async {
    final database = Provider.of<AppDatabase>(context, listen: false);
    List<Child> child = await database.getAllChildren();
    if (child.isEmpty) {
      showSurveyDialog();
    }
  }

  void showSurveyDialog() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SurveyForm(onSubmit: _saveSurveyData),
            ),
          ),
        );
      },
    );
  }

  Future<void> _saveSurveyData(Map<String, dynamic> data) async {
    final database = Provider.of<AppDatabase>(context, listen: false);
    await database.insertChild(ChildrenCompanion(
      name: drift.Value(data['name']),
      age: drift.Value(data['age']),
      weight: drift.Value(data['weight']),
      healthStatus: drift.Value(data['healthStatus']),
      specialNeeds: drift.Value(data['specialNeeds']),
    ));
    setState(() {});
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
          selectedItemColor: Colors.orange,
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
          selectedLabelTextStyle: const TextStyle(color: Colors.orange),
          selectedIconTheme: const IconThemeData(color: Colors.orange),
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

class SurveyForm extends StatefulWidget {
  final Function(Map<String, dynamic>) onSubmit;

  const SurveyForm({Key? key, required this.onSubmit}) : super(key: key);

  @override
  SurveyFormState createState() => SurveyFormState();
}

class SurveyFormState extends State<SurveyForm> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  int _age = 0;
  double _weight = 0.0;
  String _healthStatus = '';
  String _specialNeeds = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(labelText: 'Name'),
            onSaved: (value) {
              _name = value!;
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a name';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Age'),
            keyboardType: TextInputType.number,
            onSaved: (value) {
              _age = int.parse(value!);
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter an age';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Weight'),
            keyboardType: TextInputType.number,
            onSaved: (value) {
              _weight = double.parse(value!);
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a weight';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Health Status'),
            onSaved: (value) {
              _healthStatus = value!;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Special Needs'),
            onSaved: (value) {
              _specialNeeds = value!;
            },
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState?.validate() ?? false) {
                  _formKey.currentState?.save();
                  widget.onSubmit({
                    'name': _name,
                    'age': _age,
                    'weight': _weight,
                    'healthStatus': _healthStatus,
                    'specialNeeds': _specialNeeds,
                  });
                }
              },
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}

class FeedingScreen extends StatelessWidget {
  const FeedingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Feeding Module'),
    );
  }
}

class LearningScreen extends StatelessWidget {
  const LearningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Learning Module'),
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
