import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'calories.dart';
import 'database.dart';

class GeneratePage extends StatefulWidget {
  const GeneratePage({super.key});

  @override
  _GeneratePageState createState() => _GeneratePageState();
}

class _GeneratePageState extends State<GeneratePage> {
  int _currentStep = 0;
  final MyDatabase _db = MyDatabase();

  UserInfoData? _userInfo;

  final List<String> _titles = [
    'What do you like to eat?',
    'How do you measure things?',
    'What is your goal?',
    'Tell us about yourself',
    'Welcome!'
  ];

  final List<String> _subtitles = [
    'Choose from a pre-set diet. You can fine-tune the excluded foods later.',
    'We will use this to set goals and display amounts in recipes.',
    'This information lets us suggest meals to help you reach your goal.',
    'This information lets us estimate your nutrition requirements for each day.',
    ''
  ];

  UserOptions selectedOptions = UserOptions();

  var selectAvoidFoods = Set<String>();

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
        selectedOptions.fromUserInfo(_userInfo!);
      });
    }
  }

  Future<void> _saveUserInfo() async {
    final userInfo = UserInfoCompanion(
      preferredDiet: drift.Value(selectedOptions.preferredDiet),
      preferredUnits: drift.Value(selectedOptions.preferredUnits),
      goal: drift.Value(selectedOptions.goal),
      sex: drift.Value(selectedOptions.sex),
      heightFt: drift.Value(selectedOptions.heightFt),
      weight: drift.Value(selectedOptions.weight),
      age: drift.Value(selectedOptions.age),
      bodyFat: drift.Value(selectedOptions.bodyFat),
      activityLevel: drift.Value(selectedOptions.activityLevel),
      weightGoal: drift.Value(selectedOptions.weightGoal),
      wantTo: drift.Value(selectedOptions.wantTo),
      targetWeight: drift.Value(selectedOptions.targetWeight),
    );

    await _db.deleteAllUsers();
    await _db.insertUser(userInfo);

    await _SaveUserCaloriesInfo();
  }

  void _onStepContinue() async {
    if (_currentStep < _generateSteps().length - 1) {
      setState(() {
        _currentStep += 1;
      });
    } else {
      await _saveUserInfo();
      Navigator.pop(context);
    }
  }

  void _onStepCancel() {
    if (_currentStep > 0) {
      setState(() {
        _currentStep -= 1;
      });
    }
  }

  void _onStepTapped(int step) {
    setState(() {
      _currentStep = step;
    });
  }

  Widget _buildOptionCard(
      String value, String imagePath, String title, String subtitle, String groupValue, ValueChanged<String?> onChanged) {
    return Card(
      color: groupValue == value ? Colors.blue.shade100 : Colors.white,
      child: InkWell(
        onTap: () {
          onChanged(value);
        },
        child: Row(
          children: [
            SvgPicture.asset(
              imagePath,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text(subtitle, style: const TextStyle(fontSize: 14)),
                ],
              ),
            ),
            Radio<String>(
              value: value,
              groupValue: groupValue,
              onChanged: onChanged,
            ),
          ],
        ),
      ),
    );
  }

  List<Step> _generateSteps() {
    return [
      Step(
        title: const Text(''),
        content: Column(
          children: <Widget>[
            _buildOptionCard('Anything', 'assets/anything.svg', 'Anything', 'Excludes: Nothing', selectedOptions.preferredDiet, (value) {
              setState(() {
                selectedOptions.preferredDiet = value!;
              });
            }),
            _buildOptionCard('Keto', 'assets/keto.svg', 'Keto', 'Excludes: Grains, Legumes, Starchy Vegetables', selectedOptions.preferredDiet, (value) {
              setState(() {
                selectedOptions.preferredDiet = value!;
              });
            }),
            _buildOptionCard('Mediterranean', 'assets/mediterranean.svg', 'Mediterranean', 'Excludes: Red Meat, Fruit juice, Starchy Vegetables', selectedOptions.preferredDiet, (value) {
              setState(() {
                selectedOptions.preferredDiet = value!;
              });
            }),
            _buildOptionCard('Paleo', 'assets/paleo.svg', 'Paleo', 'Excludes: Dairy, Grains, Legumes, Soy, Starchy Vegetables', selectedOptions.preferredDiet, (value) {
              setState(() {
                selectedOptions.preferredDiet = value!;
              });
            }),
            _buildOptionCard('Vegan', 'assets/vegan.svg', 'Vegan', 'Excludes: Red Meat, Poultry, Fish, Shellfish, Dairy, Eggs, Mayo, Honey', selectedOptions.preferredDiet, (value) {
              setState(() {
                selectedOptions.preferredDiet = value!;
              });
            }),
            _buildOptionCard('Vegetarian', 'assets/vegetarian.svg', 'Vegetarian', 'Excludes: Red Meat, Poultry, Fish, Shellfish', selectedOptions.preferredDiet, (value) {
              setState(() {
                selectedOptions.preferredDiet = value!;
              });
            }),
            _buildOptionCard('No Pork', 'assets/nopork.svg', 'No Pork', 'Excludes: Pork', selectedOptions.preferredDiet, (value) {
              setState(() {
                selectedOptions.preferredDiet = value!;
              });
            }),
            _buildOptionCard('Nut Free', 'assets/nutfree.svg', 'Nut Free', 'Excludes: Nuts', selectedOptions.preferredDiet, (value) {
              setState(() {
                selectedOptions.preferredDiet = value!;
              });
            }),
          ],
        ),
        isActive: _currentStep >= 0,
        state: _currentStep >= 0 ? StepState.complete : StepState.disabled,
      ),
      Step(
        title: const Text(''),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const Text(
              'Preferred units: ',
              style: TextStyle(fontSize: 18),
            ),
            DropdownButton<String>(
              value: selectedOptions.preferredUnits,
              icon: Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              style: TextStyle(color: Colors.deepPurple),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (String? newValue) {
                setState(() {
                  selectedOptions.preferredUnits = newValue!;
                });
              },
              items: <String>['Metric']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ],
        ),
        isActive: _currentStep >= 2,
        state: _currentStep >= 2 ? StepState.complete : StepState.disabled,
      ),
      Step(
        title: const Text(''),
        content: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text(
                  'Set a goal: ',
                  style: TextStyle(fontSize: 18),
                ),
                DropdownButton<String>(
                  value: selectedOptions.goal,
                  icon: Icon(Icons.arrow_downward),
                  iconSize: 24,
                  elevation: 16,
                  style: TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 2,
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedOptions.goal = newValue!;
                    });
                  },
                  items: <String>['General Goal', 'Exact Goal']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
            const Divider(),
            if (selectedOptions.goal == 'General Goal') ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text(
                    'I want to: ',
                    style: TextStyle(fontSize: 18),
                  ),
                  DropdownButton<String>(
                    value: selectedOptions.wantTo,
                    icon: const Icon(Icons.arrow_downward),
                    iconSize: 24,
                    elevation: 16,
                    style: const TextStyle(color: Colors.deepPurple),
                    underline: Container(
                      height: 2,
                      color: Colors.deepPurpleAccent,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedOptions.wantTo = newValue!;
                      });
                    },
                    items: <String>['Lose fat', 'Maintain weight', 'Build muscle']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ] else if (selectedOptions.goal == 'Exact Goal') ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text(
                    'Your weight goal: ',
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(width: 50),
                  Expanded(
                    child: TextField(
                      decoration: const InputDecoration(
                        // labelText: 'Enter value',
                        suffixText: 'kgs',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (text) {
                        setState(() {
                          selectedOptions.weightGoal = text;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text(
                    'Target weight change: ',
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      decoration: const InputDecoration(
                        // labelText: 'Enter value',
                        suffixText: 'kgs a week',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (text) {
                        setState(() {
                          selectedOptions.targetWeight = text;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
        isActive: _currentStep >= 3,
        state: _currentStep >= 3 ? StepState.complete : StepState.disabled,
      ),
      Step(
        title: const Text(''),
        content: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text(
                  'Sex: ',
                  style: TextStyle(fontSize: 18),
                ),
                DropdownButton<String>(
                  value: selectedOptions.sex,
                  icon: Icon(Icons.arrow_downward),
                  iconSize: 24,
                  elevation: 16,
                  style: TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 2,
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedOptions.sex = newValue!;
                    });
                  },
                  items: <String>['Male', 'Female', 'Non-Binary']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text(
                  'Height: ',
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(width: 50),
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      // labelText: 'Enter value',
                      suffixText: 'cm',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (text) {
                      setState(() {
                        selectedOptions.heightFt = text;
                      });
                    },
                  ),
                )
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text(
                  'Weight: ',
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(width: 50),
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      // labelText: 'Enter value',
                      suffixText: 'kgs',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (text) {
                      setState(() {
                        selectedOptions.weight = text;
                      });
                    },
                  ),
                ),
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text(
                  'Age: ',
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(width: 50),
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      // labelText: 'Enter value',
                      suffixText: 'years',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (text) {
                      setState(() {
                        selectedOptions.age = text;
                      });
                    },
                  ),
                ),
              ],
            ),
            // const Divider(),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: <Widget>[
            //     const Text(
            //       'Bodyfat: ',
            //       style: TextStyle(fontSize: 18),
            //     ),
            //     DropdownButton<String>(
            //       value: selectedOptions.bodyFat,
            //       icon: Icon(Icons.arrow_downward),
            //       iconSize: 24,
            //       elevation: 16,
            //       style: TextStyle(color: Colors.deepPurple),
            //       underline: Container(
            //         height: 2,
            //         color: Colors.deepPurpleAccent,
            //       ),
            //       onChanged: (String? newValue) {
            //         setState(() {
            //           selectedOptions.bodyFat = newValue!;
            //         });
            //       },
            //       items: <String>['Low', 'Medium', 'High']
            //           .map<DropdownMenuItem<String>>((String value) {
            //         return DropdownMenuItem<String>(
            //           value: value,
            //           child: Text(value),
            //         );
            //       }).toList(),
            //     ),
            //   ],
            // ),
            // const Divider(),
            // const Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: <Widget>[
            //     Text(
            //       'Activity Level: ',
            //       style: TextStyle(fontSize: 18),
            //     ),
            //   ],
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: <Widget>[
            //     DropdownButton<String>(
            //       value: selectedOptions.activityLevel,
            //       icon: const Icon(Icons.arrow_downward),
            //       iconSize: 24,
            //       elevation: 16,
            //       style: const TextStyle(color: Colors.deepPurple),
            //       underline: Container(
            //         height: 2,
            //         color: Colors.deepPurpleAccent,
            //       ),
            //       onChanged: (String? newValue) {
            //         setState(() {
            //           selectedOptions.activityLevel = newValue!;
            //         });
            //       },
            //       items: <String>[
            //         'Desk job, light exercise',
            //         'Lightly active, workout 3-4 times/week',
            //         'Active daily, frequent exercise',
            //         'Very Athletic',
            //         'Extremely Athletic'
            //       ].map<DropdownMenuItem<String>>((String value) {
            //         return DropdownMenuItem<String>(
            //           value: value,
            //           child: Text(value),
            //         );
            //       }).toList(),
            //     ),
            //   ],
            // ),
          ],
        ),
        isActive: _currentStep >= 4,
        state: _currentStep >= 4 ? StepState.complete : StepState.disabled,
      ),
      Step(
        title: const Text(''),
        content: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.network(
                  'https://www.eatthismuch.com/app/_app/immutable/assets/party-2x.Damqns-j.webp',
                  height: 200,
                ),
                const SizedBox(height: 10),
              ],
            ),
            const Text(
              "Your account is setup and you're ready to begin using nutrikid.",
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
        isActive: _currentStep >= 5,
        state: _currentStep >= 5 ? StepState.complete : StepState.disabled,
      ),
    ];
  }

  Future<void> _SaveUserCaloriesInfo() async {
    final users = await _db.getAllUsers();

    if (users.isNotEmpty) {
        _userInfo = users.first;
        // 获取 wantTo 的第一个字母
        String wantToFirstLetter = _userInfo!.wantTo.substring(0, 1);
        Map<String,double> bodyfatDic = {
          "Low":10,
          "Medium":20,
          "Height":30
        };

        Map<String,double> ActivityLevDic = {
          'Desk job, light exercise':1.2,
          'Lightly active, workout 3-4 times/week':1.375,
          'Active daily, frequent exercise':1.55,
          'Very Athletic':1.725,
          'Extremely Athletic':1.9
        };

        // 构建参数并调用 calculateMacros 函数
        CaloriesCompanion calculatedValues = MacroCalculator.calculateMacros(
          double.tryParse(_userInfo!.age) ?? 0,
          double.tryParse(_userInfo!.weight) ?? 0,
          (double.tryParse(_userInfo!.heightFt) ?? 0),
          _userInfo!.sex.isNotEmpty ? _userInfo!.sex.substring(0, 1) : '',
          wantToFirstLetter,
          bodyfatDic[_userInfo!.bodyFat] ?? 20,
            ActivityLevDic[_userInfo!.activityLevel] ?? 1.55,
          _userInfo!.preferredDiet.toLowerCase()
        );
        await _db.clearCalories();
        await _db.insertCalories(calculatedValues);
    }
  }

  @override
  Widget build(BuildContext context) {
    final Text title = Text(_titles[_currentStep]);
    final Text subtitle = Text(_subtitles[_currentStep], style: TextStyle(fontSize: 14.0));

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            title,
            subtitle,
          ],
        ),
      ),
      body: Stepper(
        type: StepperType.horizontal,
        currentStep: _currentStep,
        onStepContinue: _onStepContinue,
        onStepTapped: _onStepTapped,
        steps: _generateSteps(),
        controlsBuilder: (BuildContext context, ControlsDetails details) {
          return Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: details.onStepContinue,
                child: const Text('Continue'),
              ),
            ),
          );
        },
      ),
    );
  }
}

class UserOptions {
  String preferredDiet = 'Anything';
  String preferredUnits = 'Metric';
  String goal = 'General Goal';
  String sex = 'Male';
  String heightFt = '0';
  String heightIn = '0';
  String weight = '0';
  String age = '0';
  String bodyFat = 'Low';
  String activityLevel = 'Desk job, light exercise';
  String weightGoal = '0';
  String wantTo = 'Lose fat';
  String targetWeight = '0';

  void fromUserInfo(UserInfoData userInfo) {
    preferredDiet = userInfo.preferredDiet;
    preferredUnits = userInfo.preferredUnits;
    goal = userInfo.goal;
    sex = userInfo.sex;
    heightFt = userInfo.heightFt;
    weight = userInfo.weight;
    age = userInfo.age;
    bodyFat = userInfo.bodyFat;
    activityLevel = userInfo.activityLevel;
    weightGoal = userInfo.weightGoal;
    wantTo = userInfo.wantTo;
    targetWeight = userInfo.targetWeight;
  }
}
