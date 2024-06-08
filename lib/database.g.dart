// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $UserInfoTable extends UserInfo
    with TableInfo<$UserInfoTable, UserInfoData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserInfoTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _preferredDietMeta =
      const VerificationMeta('preferredDiet');
  @override
  late final GeneratedColumn<String> preferredDiet = GeneratedColumn<String>(
      'preferred_diet', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _preferredUnitsMeta =
      const VerificationMeta('preferredUnits');
  @override
  late final GeneratedColumn<String> preferredUnits = GeneratedColumn<String>(
      'preferred_units', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 20),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _goalMeta = const VerificationMeta('goal');
  @override
  late final GeneratedColumn<String> goal = GeneratedColumn<String>(
      'goal', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 20),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _wantToMeta = const VerificationMeta('wantTo');
  @override
  late final GeneratedColumn<String> wantTo = GeneratedColumn<String>(
      'want_to', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 20),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _sexMeta = const VerificationMeta('sex');
  @override
  late final GeneratedColumn<String> sex = GeneratedColumn<String>(
      'sex', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 10),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _heightFtMeta =
      const VerificationMeta('heightFt');
  @override
  late final GeneratedColumn<String> heightFt = GeneratedColumn<String>(
      'height_ft', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 5),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _weightMeta = const VerificationMeta('weight');
  @override
  late final GeneratedColumn<String> weight = GeneratedColumn<String>(
      'weight', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 5),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _ageMeta = const VerificationMeta('age');
  @override
  late final GeneratedColumn<String> age = GeneratedColumn<String>(
      'age', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 5),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _bodyFatMeta =
      const VerificationMeta('bodyFat');
  @override
  late final GeneratedColumn<String> bodyFat = GeneratedColumn<String>(
      'body_fat', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 10),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _activityLevelMeta =
      const VerificationMeta('activityLevel');
  @override
  late final GeneratedColumn<String> activityLevel = GeneratedColumn<String>(
      'activity_level', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _weightGoalMeta =
      const VerificationMeta('weightGoal');
  @override
  late final GeneratedColumn<String> weightGoal = GeneratedColumn<String>(
      'weight_goal', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 5),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _targetWeightMeta =
      const VerificationMeta('targetWeight');
  @override
  late final GeneratedColumn<String> targetWeight = GeneratedColumn<String>(
      'target_weight', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 5),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        preferredDiet,
        preferredUnits,
        goal,
        wantTo,
        sex,
        heightFt,
        weight,
        age,
        bodyFat,
        activityLevel,
        weightGoal,
        targetWeight
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_info';
  @override
  VerificationContext validateIntegrity(Insertable<UserInfoData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('preferred_diet')) {
      context.handle(
          _preferredDietMeta,
          preferredDiet.isAcceptableOrUnknown(
              data['preferred_diet']!, _preferredDietMeta));
    } else if (isInserting) {
      context.missing(_preferredDietMeta);
    }
    if (data.containsKey('preferred_units')) {
      context.handle(
          _preferredUnitsMeta,
          preferredUnits.isAcceptableOrUnknown(
              data['preferred_units']!, _preferredUnitsMeta));
    } else if (isInserting) {
      context.missing(_preferredUnitsMeta);
    }
    if (data.containsKey('goal')) {
      context.handle(
          _goalMeta, goal.isAcceptableOrUnknown(data['goal']!, _goalMeta));
    } else if (isInserting) {
      context.missing(_goalMeta);
    }
    if (data.containsKey('want_to')) {
      context.handle(_wantToMeta,
          wantTo.isAcceptableOrUnknown(data['want_to']!, _wantToMeta));
    } else if (isInserting) {
      context.missing(_wantToMeta);
    }
    if (data.containsKey('sex')) {
      context.handle(
          _sexMeta, sex.isAcceptableOrUnknown(data['sex']!, _sexMeta));
    } else if (isInserting) {
      context.missing(_sexMeta);
    }
    if (data.containsKey('height_ft')) {
      context.handle(_heightFtMeta,
          heightFt.isAcceptableOrUnknown(data['height_ft']!, _heightFtMeta));
    } else if (isInserting) {
      context.missing(_heightFtMeta);
    }
    if (data.containsKey('weight')) {
      context.handle(_weightMeta,
          weight.isAcceptableOrUnknown(data['weight']!, _weightMeta));
    } else if (isInserting) {
      context.missing(_weightMeta);
    }
    if (data.containsKey('age')) {
      context.handle(
          _ageMeta, age.isAcceptableOrUnknown(data['age']!, _ageMeta));
    } else if (isInserting) {
      context.missing(_ageMeta);
    }
    if (data.containsKey('body_fat')) {
      context.handle(_bodyFatMeta,
          bodyFat.isAcceptableOrUnknown(data['body_fat']!, _bodyFatMeta));
    } else if (isInserting) {
      context.missing(_bodyFatMeta);
    }
    if (data.containsKey('activity_level')) {
      context.handle(
          _activityLevelMeta,
          activityLevel.isAcceptableOrUnknown(
              data['activity_level']!, _activityLevelMeta));
    } else if (isInserting) {
      context.missing(_activityLevelMeta);
    }
    if (data.containsKey('weight_goal')) {
      context.handle(
          _weightGoalMeta,
          weightGoal.isAcceptableOrUnknown(
              data['weight_goal']!, _weightGoalMeta));
    } else if (isInserting) {
      context.missing(_weightGoalMeta);
    }
    if (data.containsKey('target_weight')) {
      context.handle(
          _targetWeightMeta,
          targetWeight.isAcceptableOrUnknown(
              data['target_weight']!, _targetWeightMeta));
    } else if (isInserting) {
      context.missing(_targetWeightMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserInfoData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserInfoData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      preferredDiet: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}preferred_diet'])!,
      preferredUnits: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}preferred_units'])!,
      goal: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}goal'])!,
      wantTo: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}want_to'])!,
      sex: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sex'])!,
      heightFt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}height_ft'])!,
      weight: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}weight'])!,
      age: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}age'])!,
      bodyFat: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}body_fat'])!,
      activityLevel: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}activity_level'])!,
      weightGoal: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}weight_goal'])!,
      targetWeight: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}target_weight'])!,
    );
  }

  @override
  $UserInfoTable createAlias(String alias) {
    return $UserInfoTable(attachedDatabase, alias);
  }
}

class UserInfoData extends DataClass implements Insertable<UserInfoData> {
  final int id;
  final String preferredDiet;
  final String preferredUnits;
  final String goal;
  final String wantTo;
  final String sex;
  final String heightFt;
  final String weight;
  final String age;
  final String bodyFat;
  final String activityLevel;
  final String weightGoal;
  final String targetWeight;
  const UserInfoData(
      {required this.id,
      required this.preferredDiet,
      required this.preferredUnits,
      required this.goal,
      required this.wantTo,
      required this.sex,
      required this.heightFt,
      required this.weight,
      required this.age,
      required this.bodyFat,
      required this.activityLevel,
      required this.weightGoal,
      required this.targetWeight});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['preferred_diet'] = Variable<String>(preferredDiet);
    map['preferred_units'] = Variable<String>(preferredUnits);
    map['goal'] = Variable<String>(goal);
    map['want_to'] = Variable<String>(wantTo);
    map['sex'] = Variable<String>(sex);
    map['height_ft'] = Variable<String>(heightFt);
    map['weight'] = Variable<String>(weight);
    map['age'] = Variable<String>(age);
    map['body_fat'] = Variable<String>(bodyFat);
    map['activity_level'] = Variable<String>(activityLevel);
    map['weight_goal'] = Variable<String>(weightGoal);
    map['target_weight'] = Variable<String>(targetWeight);
    return map;
  }

  UserInfoCompanion toCompanion(bool nullToAbsent) {
    return UserInfoCompanion(
      id: Value(id),
      preferredDiet: Value(preferredDiet),
      preferredUnits: Value(preferredUnits),
      goal: Value(goal),
      wantTo: Value(wantTo),
      sex: Value(sex),
      heightFt: Value(heightFt),
      weight: Value(weight),
      age: Value(age),
      bodyFat: Value(bodyFat),
      activityLevel: Value(activityLevel),
      weightGoal: Value(weightGoal),
      targetWeight: Value(targetWeight),
    );
  }

  factory UserInfoData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserInfoData(
      id: serializer.fromJson<int>(json['id']),
      preferredDiet: serializer.fromJson<String>(json['preferredDiet']),
      preferredUnits: serializer.fromJson<String>(json['preferredUnits']),
      goal: serializer.fromJson<String>(json['goal']),
      wantTo: serializer.fromJson<String>(json['wantTo']),
      sex: serializer.fromJson<String>(json['sex']),
      heightFt: serializer.fromJson<String>(json['heightFt']),
      weight: serializer.fromJson<String>(json['weight']),
      age: serializer.fromJson<String>(json['age']),
      bodyFat: serializer.fromJson<String>(json['bodyFat']),
      activityLevel: serializer.fromJson<String>(json['activityLevel']),
      weightGoal: serializer.fromJson<String>(json['weightGoal']),
      targetWeight: serializer.fromJson<String>(json['targetWeight']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'preferredDiet': serializer.toJson<String>(preferredDiet),
      'preferredUnits': serializer.toJson<String>(preferredUnits),
      'goal': serializer.toJson<String>(goal),
      'wantTo': serializer.toJson<String>(wantTo),
      'sex': serializer.toJson<String>(sex),
      'heightFt': serializer.toJson<String>(heightFt),
      'weight': serializer.toJson<String>(weight),
      'age': serializer.toJson<String>(age),
      'bodyFat': serializer.toJson<String>(bodyFat),
      'activityLevel': serializer.toJson<String>(activityLevel),
      'weightGoal': serializer.toJson<String>(weightGoal),
      'targetWeight': serializer.toJson<String>(targetWeight),
    };
  }

  UserInfoData copyWith(
          {int? id,
          String? preferredDiet,
          String? preferredUnits,
          String? goal,
          String? wantTo,
          String? sex,
          String? heightFt,
          String? weight,
          String? age,
          String? bodyFat,
          String? activityLevel,
          String? weightGoal,
          String? targetWeight}) =>
      UserInfoData(
        id: id ?? this.id,
        preferredDiet: preferredDiet ?? this.preferredDiet,
        preferredUnits: preferredUnits ?? this.preferredUnits,
        goal: goal ?? this.goal,
        wantTo: wantTo ?? this.wantTo,
        sex: sex ?? this.sex,
        heightFt: heightFt ?? this.heightFt,
        weight: weight ?? this.weight,
        age: age ?? this.age,
        bodyFat: bodyFat ?? this.bodyFat,
        activityLevel: activityLevel ?? this.activityLevel,
        weightGoal: weightGoal ?? this.weightGoal,
        targetWeight: targetWeight ?? this.targetWeight,
      );
  @override
  String toString() {
    return (StringBuffer('UserInfoData(')
          ..write('id: $id, ')
          ..write('preferredDiet: $preferredDiet, ')
          ..write('preferredUnits: $preferredUnits, ')
          ..write('goal: $goal, ')
          ..write('wantTo: $wantTo, ')
          ..write('sex: $sex, ')
          ..write('heightFt: $heightFt, ')
          ..write('weight: $weight, ')
          ..write('age: $age, ')
          ..write('bodyFat: $bodyFat, ')
          ..write('activityLevel: $activityLevel, ')
          ..write('weightGoal: $weightGoal, ')
          ..write('targetWeight: $targetWeight')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      preferredDiet,
      preferredUnits,
      goal,
      wantTo,
      sex,
      heightFt,
      weight,
      age,
      bodyFat,
      activityLevel,
      weightGoal,
      targetWeight);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserInfoData &&
          other.id == this.id &&
          other.preferredDiet == this.preferredDiet &&
          other.preferredUnits == this.preferredUnits &&
          other.goal == this.goal &&
          other.wantTo == this.wantTo &&
          other.sex == this.sex &&
          other.heightFt == this.heightFt &&
          other.weight == this.weight &&
          other.age == this.age &&
          other.bodyFat == this.bodyFat &&
          other.activityLevel == this.activityLevel &&
          other.weightGoal == this.weightGoal &&
          other.targetWeight == this.targetWeight);
}

class UserInfoCompanion extends UpdateCompanion<UserInfoData> {
  final Value<int> id;
  final Value<String> preferredDiet;
  final Value<String> preferredUnits;
  final Value<String> goal;
  final Value<String> wantTo;
  final Value<String> sex;
  final Value<String> heightFt;
  final Value<String> weight;
  final Value<String> age;
  final Value<String> bodyFat;
  final Value<String> activityLevel;
  final Value<String> weightGoal;
  final Value<String> targetWeight;
  const UserInfoCompanion({
    this.id = const Value.absent(),
    this.preferredDiet = const Value.absent(),
    this.preferredUnits = const Value.absent(),
    this.goal = const Value.absent(),
    this.wantTo = const Value.absent(),
    this.sex = const Value.absent(),
    this.heightFt = const Value.absent(),
    this.weight = const Value.absent(),
    this.age = const Value.absent(),
    this.bodyFat = const Value.absent(),
    this.activityLevel = const Value.absent(),
    this.weightGoal = const Value.absent(),
    this.targetWeight = const Value.absent(),
  });
  UserInfoCompanion.insert({
    this.id = const Value.absent(),
    required String preferredDiet,
    required String preferredUnits,
    required String goal,
    required String wantTo,
    required String sex,
    required String heightFt,
    required String weight,
    required String age,
    required String bodyFat,
    required String activityLevel,
    required String weightGoal,
    required String targetWeight,
  })  : preferredDiet = Value(preferredDiet),
        preferredUnits = Value(preferredUnits),
        goal = Value(goal),
        wantTo = Value(wantTo),
        sex = Value(sex),
        heightFt = Value(heightFt),
        weight = Value(weight),
        age = Value(age),
        bodyFat = Value(bodyFat),
        activityLevel = Value(activityLevel),
        weightGoal = Value(weightGoal),
        targetWeight = Value(targetWeight);
  static Insertable<UserInfoData> custom({
    Expression<int>? id,
    Expression<String>? preferredDiet,
    Expression<String>? preferredUnits,
    Expression<String>? goal,
    Expression<String>? wantTo,
    Expression<String>? sex,
    Expression<String>? heightFt,
    Expression<String>? weight,
    Expression<String>? age,
    Expression<String>? bodyFat,
    Expression<String>? activityLevel,
    Expression<String>? weightGoal,
    Expression<String>? targetWeight,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (preferredDiet != null) 'preferred_diet': preferredDiet,
      if (preferredUnits != null) 'preferred_units': preferredUnits,
      if (goal != null) 'goal': goal,
      if (wantTo != null) 'want_to': wantTo,
      if (sex != null) 'sex': sex,
      if (heightFt != null) 'height_ft': heightFt,
      if (weight != null) 'weight': weight,
      if (age != null) 'age': age,
      if (bodyFat != null) 'body_fat': bodyFat,
      if (activityLevel != null) 'activity_level': activityLevel,
      if (weightGoal != null) 'weight_goal': weightGoal,
      if (targetWeight != null) 'target_weight': targetWeight,
    });
  }

  UserInfoCompanion copyWith(
      {Value<int>? id,
      Value<String>? preferredDiet,
      Value<String>? preferredUnits,
      Value<String>? goal,
      Value<String>? wantTo,
      Value<String>? sex,
      Value<String>? heightFt,
      Value<String>? weight,
      Value<String>? age,
      Value<String>? bodyFat,
      Value<String>? activityLevel,
      Value<String>? weightGoal,
      Value<String>? targetWeight}) {
    return UserInfoCompanion(
      id: id ?? this.id,
      preferredDiet: preferredDiet ?? this.preferredDiet,
      preferredUnits: preferredUnits ?? this.preferredUnits,
      goal: goal ?? this.goal,
      wantTo: wantTo ?? this.wantTo,
      sex: sex ?? this.sex,
      heightFt: heightFt ?? this.heightFt,
      weight: weight ?? this.weight,
      age: age ?? this.age,
      bodyFat: bodyFat ?? this.bodyFat,
      activityLevel: activityLevel ?? this.activityLevel,
      weightGoal: weightGoal ?? this.weightGoal,
      targetWeight: targetWeight ?? this.targetWeight,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (preferredDiet.present) {
      map['preferred_diet'] = Variable<String>(preferredDiet.value);
    }
    if (preferredUnits.present) {
      map['preferred_units'] = Variable<String>(preferredUnits.value);
    }
    if (goal.present) {
      map['goal'] = Variable<String>(goal.value);
    }
    if (wantTo.present) {
      map['want_to'] = Variable<String>(wantTo.value);
    }
    if (sex.present) {
      map['sex'] = Variable<String>(sex.value);
    }
    if (heightFt.present) {
      map['height_ft'] = Variable<String>(heightFt.value);
    }
    if (weight.present) {
      map['weight'] = Variable<String>(weight.value);
    }
    if (age.present) {
      map['age'] = Variable<String>(age.value);
    }
    if (bodyFat.present) {
      map['body_fat'] = Variable<String>(bodyFat.value);
    }
    if (activityLevel.present) {
      map['activity_level'] = Variable<String>(activityLevel.value);
    }
    if (weightGoal.present) {
      map['weight_goal'] = Variable<String>(weightGoal.value);
    }
    if (targetWeight.present) {
      map['target_weight'] = Variable<String>(targetWeight.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserInfoCompanion(')
          ..write('id: $id, ')
          ..write('preferredDiet: $preferredDiet, ')
          ..write('preferredUnits: $preferredUnits, ')
          ..write('goal: $goal, ')
          ..write('wantTo: $wantTo, ')
          ..write('sex: $sex, ')
          ..write('heightFt: $heightFt, ')
          ..write('weight: $weight, ')
          ..write('age: $age, ')
          ..write('bodyFat: $bodyFat, ')
          ..write('activityLevel: $activityLevel, ')
          ..write('weightGoal: $weightGoal, ')
          ..write('targetWeight: $targetWeight')
          ..write(')'))
        .toString();
  }
}

class $MealsTable extends Meals with TableInfo<$MealsTable, Meal> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MealsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: Constant(DateTime.now()));
  static const VerificationMeta _mealsMeta = const VerificationMeta('meals');
  @override
  late final GeneratedColumn<String> meals = GeneratedColumn<String>(
      'meals', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _foodInfosMeta =
      const VerificationMeta('foodInfos');
  @override
  late final GeneratedColumn<String> foodInfos = GeneratedColumn<String>(
      'food_infos', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, date, meals, foodInfos];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'meals';
  @override
  VerificationContext validateIntegrity(Insertable<Meal> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    }
    if (data.containsKey('meals')) {
      context.handle(
          _mealsMeta, meals.isAcceptableOrUnknown(data['meals']!, _mealsMeta));
    } else if (isInserting) {
      context.missing(_mealsMeta);
    }
    if (data.containsKey('food_infos')) {
      context.handle(_foodInfosMeta,
          foodInfos.isAcceptableOrUnknown(data['food_infos']!, _foodInfosMeta));
    } else if (isInserting) {
      context.missing(_foodInfosMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Meal map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Meal(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      meals: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}meals'])!,
      foodInfos: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}food_infos'])!,
    );
  }

  @override
  $MealsTable createAlias(String alias) {
    return $MealsTable(attachedDatabase, alias);
  }
}

class Meal extends DataClass implements Insertable<Meal> {
  final int id;
  final DateTime date;
  final String meals;
  final String foodInfos;
  const Meal(
      {required this.id,
      required this.date,
      required this.meals,
      required this.foodInfos});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['date'] = Variable<DateTime>(date);
    map['meals'] = Variable<String>(meals);
    map['food_infos'] = Variable<String>(foodInfos);
    return map;
  }

  MealsCompanion toCompanion(bool nullToAbsent) {
    return MealsCompanion(
      id: Value(id),
      date: Value(date),
      meals: Value(meals),
      foodInfos: Value(foodInfos),
    );
  }

  factory Meal.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Meal(
      id: serializer.fromJson<int>(json['id']),
      date: serializer.fromJson<DateTime>(json['date']),
      meals: serializer.fromJson<String>(json['meals']),
      foodInfos: serializer.fromJson<String>(json['foodInfos']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'date': serializer.toJson<DateTime>(date),
      'meals': serializer.toJson<String>(meals),
      'foodInfos': serializer.toJson<String>(foodInfos),
    };
  }

  Meal copyWith({int? id, DateTime? date, String? meals, String? foodInfos}) =>
      Meal(
        id: id ?? this.id,
        date: date ?? this.date,
        meals: meals ?? this.meals,
        foodInfos: foodInfos ?? this.foodInfos,
      );
  @override
  String toString() {
    return (StringBuffer('Meal(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('meals: $meals, ')
          ..write('foodInfos: $foodInfos')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, date, meals, foodInfos);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Meal &&
          other.id == this.id &&
          other.date == this.date &&
          other.meals == this.meals &&
          other.foodInfos == this.foodInfos);
}

class MealsCompanion extends UpdateCompanion<Meal> {
  final Value<int> id;
  final Value<DateTime> date;
  final Value<String> meals;
  final Value<String> foodInfos;
  const MealsCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.meals = const Value.absent(),
    this.foodInfos = const Value.absent(),
  });
  MealsCompanion.insert({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    required String meals,
    required String foodInfos,
  })  : meals = Value(meals),
        foodInfos = Value(foodInfos);
  static Insertable<Meal> custom({
    Expression<int>? id,
    Expression<DateTime>? date,
    Expression<String>? meals,
    Expression<String>? foodInfos,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (date != null) 'date': date,
      if (meals != null) 'meals': meals,
      if (foodInfos != null) 'food_infos': foodInfos,
    });
  }

  MealsCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? date,
      Value<String>? meals,
      Value<String>? foodInfos}) {
    return MealsCompanion(
      id: id ?? this.id,
      date: date ?? this.date,
      meals: meals ?? this.meals,
      foodInfos: foodInfos ?? this.foodInfos,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (meals.present) {
      map['meals'] = Variable<String>(meals.value);
    }
    if (foodInfos.present) {
      map['food_infos'] = Variable<String>(foodInfos.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MealsCompanion(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('meals: $meals, ')
          ..write('foodInfos: $foodInfos')
          ..write(')'))
        .toString();
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(e);
  _$MyDatabaseManager get managers => _$MyDatabaseManager(this);
  late final $UserInfoTable userInfo = $UserInfoTable(this);
  late final $MealsTable meals = $MealsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [userInfo, meals];
}

typedef $$UserInfoTableInsertCompanionBuilder = UserInfoCompanion Function({
  Value<int> id,
  required String preferredDiet,
  required String preferredUnits,
  required String goal,
  required String wantTo,
  required String sex,
  required String heightFt,
  required String weight,
  required String age,
  required String bodyFat,
  required String activityLevel,
  required String weightGoal,
  required String targetWeight,
});
typedef $$UserInfoTableUpdateCompanionBuilder = UserInfoCompanion Function({
  Value<int> id,
  Value<String> preferredDiet,
  Value<String> preferredUnits,
  Value<String> goal,
  Value<String> wantTo,
  Value<String> sex,
  Value<String> heightFt,
  Value<String> weight,
  Value<String> age,
  Value<String> bodyFat,
  Value<String> activityLevel,
  Value<String> weightGoal,
  Value<String> targetWeight,
});

class $$UserInfoTableTableManager extends RootTableManager<
    _$MyDatabase,
    $UserInfoTable,
    UserInfoData,
    $$UserInfoTableFilterComposer,
    $$UserInfoTableOrderingComposer,
    $$UserInfoTableProcessedTableManager,
    $$UserInfoTableInsertCompanionBuilder,
    $$UserInfoTableUpdateCompanionBuilder> {
  $$UserInfoTableTableManager(_$MyDatabase db, $UserInfoTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$UserInfoTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$UserInfoTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$UserInfoTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<String> preferredDiet = const Value.absent(),
            Value<String> preferredUnits = const Value.absent(),
            Value<String> goal = const Value.absent(),
            Value<String> wantTo = const Value.absent(),
            Value<String> sex = const Value.absent(),
            Value<String> heightFt = const Value.absent(),
            Value<String> weight = const Value.absent(),
            Value<String> age = const Value.absent(),
            Value<String> bodyFat = const Value.absent(),
            Value<String> activityLevel = const Value.absent(),
            Value<String> weightGoal = const Value.absent(),
            Value<String> targetWeight = const Value.absent(),
          }) =>
              UserInfoCompanion(
            id: id,
            preferredDiet: preferredDiet,
            preferredUnits: preferredUnits,
            goal: goal,
            wantTo: wantTo,
            sex: sex,
            heightFt: heightFt,
            weight: weight,
            age: age,
            bodyFat: bodyFat,
            activityLevel: activityLevel,
            weightGoal: weightGoal,
            targetWeight: targetWeight,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required String preferredDiet,
            required String preferredUnits,
            required String goal,
            required String wantTo,
            required String sex,
            required String heightFt,
            required String weight,
            required String age,
            required String bodyFat,
            required String activityLevel,
            required String weightGoal,
            required String targetWeight,
          }) =>
              UserInfoCompanion.insert(
            id: id,
            preferredDiet: preferredDiet,
            preferredUnits: preferredUnits,
            goal: goal,
            wantTo: wantTo,
            sex: sex,
            heightFt: heightFt,
            weight: weight,
            age: age,
            bodyFat: bodyFat,
            activityLevel: activityLevel,
            weightGoal: weightGoal,
            targetWeight: targetWeight,
          ),
        ));
}

class $$UserInfoTableProcessedTableManager extends ProcessedTableManager<
    _$MyDatabase,
    $UserInfoTable,
    UserInfoData,
    $$UserInfoTableFilterComposer,
    $$UserInfoTableOrderingComposer,
    $$UserInfoTableProcessedTableManager,
    $$UserInfoTableInsertCompanionBuilder,
    $$UserInfoTableUpdateCompanionBuilder> {
  $$UserInfoTableProcessedTableManager(super.$state);
}

class $$UserInfoTableFilterComposer
    extends FilterComposer<_$MyDatabase, $UserInfoTable> {
  $$UserInfoTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get preferredDiet => $state.composableBuilder(
      column: $state.table.preferredDiet,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get preferredUnits => $state.composableBuilder(
      column: $state.table.preferredUnits,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get goal => $state.composableBuilder(
      column: $state.table.goal,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get wantTo => $state.composableBuilder(
      column: $state.table.wantTo,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get sex => $state.composableBuilder(
      column: $state.table.sex,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get heightFt => $state.composableBuilder(
      column: $state.table.heightFt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get weight => $state.composableBuilder(
      column: $state.table.weight,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get age => $state.composableBuilder(
      column: $state.table.age,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get bodyFat => $state.composableBuilder(
      column: $state.table.bodyFat,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get activityLevel => $state.composableBuilder(
      column: $state.table.activityLevel,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get weightGoal => $state.composableBuilder(
      column: $state.table.weightGoal,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get targetWeight => $state.composableBuilder(
      column: $state.table.targetWeight,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$UserInfoTableOrderingComposer
    extends OrderingComposer<_$MyDatabase, $UserInfoTable> {
  $$UserInfoTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get preferredDiet => $state.composableBuilder(
      column: $state.table.preferredDiet,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get preferredUnits => $state.composableBuilder(
      column: $state.table.preferredUnits,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get goal => $state.composableBuilder(
      column: $state.table.goal,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get wantTo => $state.composableBuilder(
      column: $state.table.wantTo,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get sex => $state.composableBuilder(
      column: $state.table.sex,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get heightFt => $state.composableBuilder(
      column: $state.table.heightFt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get weight => $state.composableBuilder(
      column: $state.table.weight,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get age => $state.composableBuilder(
      column: $state.table.age,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get bodyFat => $state.composableBuilder(
      column: $state.table.bodyFat,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get activityLevel => $state.composableBuilder(
      column: $state.table.activityLevel,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get weightGoal => $state.composableBuilder(
      column: $state.table.weightGoal,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get targetWeight => $state.composableBuilder(
      column: $state.table.targetWeight,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$MealsTableInsertCompanionBuilder = MealsCompanion Function({
  Value<int> id,
  Value<DateTime> date,
  required String meals,
  required String foodInfos,
});
typedef $$MealsTableUpdateCompanionBuilder = MealsCompanion Function({
  Value<int> id,
  Value<DateTime> date,
  Value<String> meals,
  Value<String> foodInfos,
});

class $$MealsTableTableManager extends RootTableManager<
    _$MyDatabase,
    $MealsTable,
    Meal,
    $$MealsTableFilterComposer,
    $$MealsTableOrderingComposer,
    $$MealsTableProcessedTableManager,
    $$MealsTableInsertCompanionBuilder,
    $$MealsTableUpdateCompanionBuilder> {
  $$MealsTableTableManager(_$MyDatabase db, $MealsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$MealsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$MealsTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) => $$MealsTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
            Value<String> meals = const Value.absent(),
            Value<String> foodInfos = const Value.absent(),
          }) =>
              MealsCompanion(
            id: id,
            date: date,
            meals: meals,
            foodInfos: foodInfos,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
            required String meals,
            required String foodInfos,
          }) =>
              MealsCompanion.insert(
            id: id,
            date: date,
            meals: meals,
            foodInfos: foodInfos,
          ),
        ));
}

class $$MealsTableProcessedTableManager extends ProcessedTableManager<
    _$MyDatabase,
    $MealsTable,
    Meal,
    $$MealsTableFilterComposer,
    $$MealsTableOrderingComposer,
    $$MealsTableProcessedTableManager,
    $$MealsTableInsertCompanionBuilder,
    $$MealsTableUpdateCompanionBuilder> {
  $$MealsTableProcessedTableManager(super.$state);
}

class $$MealsTableFilterComposer
    extends FilterComposer<_$MyDatabase, $MealsTable> {
  $$MealsTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get date => $state.composableBuilder(
      column: $state.table.date,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get meals => $state.composableBuilder(
      column: $state.table.meals,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get foodInfos => $state.composableBuilder(
      column: $state.table.foodInfos,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$MealsTableOrderingComposer
    extends OrderingComposer<_$MyDatabase, $MealsTable> {
  $$MealsTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get date => $state.composableBuilder(
      column: $state.table.date,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get meals => $state.composableBuilder(
      column: $state.table.meals,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get foodInfos => $state.composableBuilder(
      column: $state.table.foodInfos,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class _$MyDatabaseManager {
  final _$MyDatabase _db;
  _$MyDatabaseManager(this._db);
  $$UserInfoTableTableManager get userInfo =>
      $$UserInfoTableTableManager(_db, _db.userInfo);
  $$MealsTableTableManager get meals =>
      $$MealsTableTableManager(_db, _db.meals);
}
