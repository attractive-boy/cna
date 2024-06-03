import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'database.dart';

class GeneratePage extends StatefulWidget {
  const GeneratePage({super.key});

  @override
  _GeneratePageState createState() => _GeneratePageState();
}

class _GeneratePageState extends State<GeneratePage> {
  int _currentStep = 0;
  MyDatabase _db = MyDatabase();

  UserInfoData? _userInfo;

  final List<String> _titles = [
    'What do you like to eat?',
    'Are there foods you avoid?',
    'How do you measure things?',
    'What is your goal?',
    'Tell us about yourself',
    'Welcome!'
  ];

  final List<String> _subtitles = [
    'Choose from a pre-set diet. You can fine-tune the excluded foods later.',
    'This may be due to allergies or any other reason.',
    'We will use this to set goals and display amounts in recipes.',
    'This information lets us suggest meals to help you reach your goal.',
    'This information lets us estimate your nutrition requirements for each day.',
    ''
  ];

  Map<String, String> selectedOptions = {
    'preferred_diet': '',
    'preferred_units': 'U.S. Standard',
    'goal':'General Goal'
  };

  Map<String,List<String>> avoidFoods = {
    'Dairy':['Dairy','Milk','Cream','Cheese','Yogurt','Cottage Cheese','Whey Powder'],
    'Eggs':['Eggs'],
    'Grains':['Grains','Breakfast Cereals','Pastas','Breads','Rice','Oatmeal','Sugar'],
    'Soy':['Soy','Tofu','Soy Milk'],
    'Red Meat':['Red Meat','Beef','Pork/Bacon','Lamb','Veal'],
    'Poultry':['Poultry','Chicken','Turkey'],
    'Fish':['Fish','Salmon','Tuna','Tilapia','Sardines','Trout & Snapper'],
    'Shellfish':['Shellfish'],
    'Mayo':['Mayo'],
    'Fats & Nuts':['Fats & Nuts','Avocados','Peanuts','Almonds','Walnuts','Pecans'],
    'Legumes':['Legumes','Beans','Lentils','Peas'],
    'Fruit':['Fruit','Apple','Banana','Grapes','Orange','Strawberries','Raspberries','Blueberries','Fruit juice'],
    'Vegetables':['Vegetables','Artichoke','Asparagus','Beets','Broccoli','Carrots','Sprouts','Celery','Peppers','Tomato','Eggplant'],
    'Starchy Vegetables':['Starchy Vegetables','Potatoes & Yams','Corn'],
    'Honey':['Honey']
  };

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
        selectedOptions['preferred_diet'] = _userInfo!.preferredDiet;
        selectedOptions['preferred_units'] = _userInfo!.preferredUnits;
        selectedOptions['goal'] = _userInfo!.goal;
        selectAvoidFoods = _userInfo!.avoidFoods;
        selectedOptions['Sex'] = _userInfo!.sex;
        selectedOptions['height_ft'] = _userInfo!.heightFt;
        selectedOptions['height_in'] = _userInfo!.heightIn;
        selectedOptions['weight'] = _userInfo!.weight;
        selectedOptions['age'] = _userInfo!.age;
        selectedOptions['body_fat'] = _userInfo!.bodyFat;
        selectedOptions['activity_level'] = _userInfo!.activityLevel;
      });
    }
  }

  Future<void> _saveUserInfo() async {
    final userInfo = UserInfoCompanion(
      preferredDiet: drift.Value(selectedOptions['preferred_diet']!),
      preferredUnits: drift.Value(selectedOptions['preferred_units']!),
      goal: drift.Value(selectedOptions['goal']!),
      avoidFoods: drift.Value(selectAvoidFoods),
      sex: drift.Value(selectedOptions['Sex']!),
      heightFt: drift.Value(selectedOptions['height_ft']!),
      heightIn: drift.Value(selectedOptions['height_in']!),
      weight: drift.Value(selectedOptions['weight']!),
      age: drift.Value(selectedOptions['age']!),
      bodyFat: drift.Value(selectedOptions['body_fat']!),
      activityLevel: drift.Value(selectedOptions['activity_level']!),
    );

    if (_userInfo == null) {
      await _db.insertUser(userInfo);
    } else {
      await _db.updateUser(UserInfoData(
        id: _userInfo!.id,
        preferredDiet: selectedOptions['preferred_diet']!,
        preferredUnits: selectedOptions['preferred_units']!,
        goal: selectedOptions['goal']!,
        avoidFoods: selectAvoidFoods,
        sex: selectedOptions['Sex']!,
        heightFt: selectedOptions['height_ft']!,
        heightIn: selectedOptions['height_in']!,
        weight: selectedOptions['weight']!,
        age: selectedOptions['age']!,
        bodyFat: selectedOptions['body_fat']!,
        activityLevel: selectedOptions['activity_level']!,
      ));
    }
  }

  void _onStepContinue() async {
    if (_currentStep < _generateSteps().length - 1) {
      setState(() {
        _currentStep += 1;
      });
    } else {
      await _saveUserInfo();
      // 在完成所有步骤后，可以执行其他操作，例如导航到另一个页面
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
            _buildOptionCard('Anything', 'assets/anything.svg', 'Anything', 'Excludes: Nothing', selectedOptions['preferred_diet']!, (value) {
              setState(() {
                selectedOptions['preferred_diet'] = value!;
              });
            }),
            _buildOptionCard('Keto', 'assets/keto.svg', 'Keto', 'Excludes: Grains, Legumes, Starchy Vegetables', selectedOptions['preferred_diet']!, (value) {
              setState(() {
                selectedOptions['preferred_diet'] = value!;
              });
            }),
            _buildOptionCard('Mediterranean', 'assets/mediterranean.svg', 'Mediterranean', 'Excludes: Red Meat, Fruit juice, Starchy Vegetables', selectedOptions['preferred_diet']!, (value) {
              setState(() {
                selectedOptions['preferred_diet'] = value!;
              });
            }),
            _buildOptionCard('Paleo', 'assets/paleo.svg', 'Paleo', 'Excludes: Dairy, Grains, Legumes, Soy, Starchy Vegetables', selectedOptions['preferred_diet']!, (value) {
              setState(() {
                selectedOptions['preferred_diet'] = value!;
              });
            }),
            _buildOptionCard('Vegan', 'assets/vegan.svg', 'Vegan', 'Excludes: Red Meat, Poultry, Fish, Shellfish, Dairy, Eggs, Mayo, Honey', selectedOptions['preferred_diet']!, (value) {
              setState(() {
                selectedOptions['preferred_diet'] = value!;
              });
            }),
            _buildOptionCard('Vegetarian', 'assets/vegetarian.svg', 'Vegetarian', 'Excludes: Red Meat, Poultry, Fish, Shellfish', selectedOptions['preferred_diet']!, (value) {
              setState(() {
                selectedOptions['preferred_diet'] = value!;
              });
            }),
          ],
        ),
        isActive: _currentStep >= 0,
        state: _currentStep >= 0 ? StepState.complete : StepState.disabled,
      ),
      Step(
        title: const Text(''),
        content: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              children: avoidFoods.keys.map((category) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      category,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    ),
                    Wrap(
                      spacing: 10.0,
                      runSpacing: 10.0,
                      children: avoidFoods[category]!.map((food) {
                        return FilterChip(
                          label: Text(food),
                          selected: selectAvoidFoods.contains(food),
                          onSelected: (bool selected) {
                            setState(() {
                              if (selected) {
                                selectAvoidFoods.add(food);
                              } else {
                                selectAvoidFoods.remove(food);
                              }
                            });
                          },
                          selectedColor: Colors.deepPurple,
                          backgroundColor: Colors.grey[200],
                        );
                      }).toList(),
                    ),
                    const Divider(),
                  ],
                );
              }).toList(),
            ),
          ),
        ),
        isActive: _currentStep >= 1,
        state: _currentStep >= 1 ? StepState.complete : StepState.disabled,
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
              value: selectedOptions['preferred_units'],
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
                  selectedOptions['preferred_units'] = newValue!;
                });
              },
              items: <String>['U.S. Standard', 'Metric']
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
                  value: selectedOptions['goal'],
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
                      selectedOptions['goal'] = newValue!;
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
            if (selectedOptions['goal'] == 'General Goal') ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text(
                    'I want to: ',
                    style: TextStyle(fontSize: 18),
                  ),
                  DropdownButton<String>(
                    value: selectedOptions['wantTo'],
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
                        selectedOptions['wantTo'] = newValue!;
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
            ] else if (selectedOptions['goal'] == 'Exact Goal') ...[
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
                        suffixText: 'lbs',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (text) {
                        setState(() {
                          selectedOptions['weight_goal'] = text;
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
                        suffixText: 'lbs a week',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (text) {
                        setState(() {
                          selectedOptions['target_weight'] = text;
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
                  value: selectedOptions['Sex'],
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
                      selectedOptions['Sex'] = newValue!;
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
                      suffixText: 'ft',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (text) {
                      setState(() {
                        selectedOptions['height_ft'] = text;
                      });
                    },
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      // labelText: 'Enter value',
                      suffixText: 'in',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (text) {
                      setState(() {
                        selectedOptions['height_in'] = text;
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
                  'Weight: ',
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(width: 50),
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      // labelText: 'Enter value',
                      suffixText: 'lbs',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (text) {
                      setState(() {
                        selectedOptions['weight'] = text;
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
                        selectedOptions['age'] = text;
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
                  'Bodyfat: ',
                  style: TextStyle(fontSize: 18),
                ),
                DropdownButton<String>(
                  value: selectedOptions['body_fat'],
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
                      selectedOptions['body_fat'] = newValue!;
                    });
                  },
                  items: <String>['Low', 'Medium', 'High']
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
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Activity Level: ',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                DropdownButton<String>(
                  value: selectedOptions['activity_level'],
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
                      selectedOptions['activity_level'] = newValue!;
                    });
                  },
                  items: <String>[
                    'Desk job, light exercise',
                    'Lightly active, workout 3-4 times/week',
                    'Active daily, frequent exercise',
                    'Very Athletic',
                    'Extremely Athletic'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
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
              "Your account is setup and you're ready to begin using Eat This Much.",
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
        isActive: _currentStep >= 5,
        state: _currentStep >= 5 ? StepState.complete : StepState.disabled,
      ),
    ];
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

void main() {
  runApp(MaterialApp(
    home: GeneratePage(),
  ));
}
