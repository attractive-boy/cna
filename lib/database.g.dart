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
  static const VerificationMeta _avoidFoodsMeta =
      const VerificationMeta('avoidFoods');
  @override
  late final GeneratedColumnWithTypeConverter<Set<String>, String> avoidFoods =
      GeneratedColumn<String>('avoid_foods', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<Set<String>>($UserInfoTable.$converteravoidFoods);
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
  static const VerificationMeta _heightInMeta =
      const VerificationMeta('heightIn');
  @override
  late final GeneratedColumn<String> heightIn = GeneratedColumn<String>(
      'height_in', aliasedName, false,
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
  @override
  List<GeneratedColumn> get $columns => [
        id,
        preferredDiet,
        preferredUnits,
        goal,
        avoidFoods,
        sex,
        heightFt,
        heightIn,
        weight,
        age,
        bodyFat,
        activityLevel
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
    context.handle(_avoidFoodsMeta, const VerificationResult.success());
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
    if (data.containsKey('height_in')) {
      context.handle(_heightInMeta,
          heightIn.isAcceptableOrUnknown(data['height_in']!, _heightInMeta));
    } else if (isInserting) {
      context.missing(_heightInMeta);
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
      avoidFoods: $UserInfoTable.$converteravoidFoods.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}avoid_foods'])!),
      sex: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sex'])!,
      heightFt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}height_ft'])!,
      heightIn: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}height_in'])!,
      weight: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}weight'])!,
      age: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}age'])!,
      bodyFat: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}body_fat'])!,
      activityLevel: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}activity_level'])!,
    );
  }

  @override
  $UserInfoTable createAlias(String alias) {
    return $UserInfoTable(attachedDatabase, alias);
  }

  static TypeConverter<Set<String>, String> $converteravoidFoods =
      const SetConverter();
}

class UserInfoData extends DataClass implements Insertable<UserInfoData> {
  final int id;
  final String preferredDiet;
  final String preferredUnits;
  final String goal;
  final Set<String> avoidFoods;
  final String sex;
  final String heightFt;
  final String heightIn;
  final String weight;
  final String age;
  final String bodyFat;
  final String activityLevel;
  const UserInfoData(
      {required this.id,
      required this.preferredDiet,
      required this.preferredUnits,
      required this.goal,
      required this.avoidFoods,
      required this.sex,
      required this.heightFt,
      required this.heightIn,
      required this.weight,
      required this.age,
      required this.bodyFat,
      required this.activityLevel});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['preferred_diet'] = Variable<String>(preferredDiet);
    map['preferred_units'] = Variable<String>(preferredUnits);
    map['goal'] = Variable<String>(goal);
    {
      map['avoid_foods'] = Variable<String>(
          $UserInfoTable.$converteravoidFoods.toSql(avoidFoods));
    }
    map['sex'] = Variable<String>(sex);
    map['height_ft'] = Variable<String>(heightFt);
    map['height_in'] = Variable<String>(heightIn);
    map['weight'] = Variable<String>(weight);
    map['age'] = Variable<String>(age);
    map['body_fat'] = Variable<String>(bodyFat);
    map['activity_level'] = Variable<String>(activityLevel);
    return map;
  }

  UserInfoCompanion toCompanion(bool nullToAbsent) {
    return UserInfoCompanion(
      id: Value(id),
      preferredDiet: Value(preferredDiet),
      preferredUnits: Value(preferredUnits),
      goal: Value(goal),
      avoidFoods: Value(avoidFoods),
      sex: Value(sex),
      heightFt: Value(heightFt),
      heightIn: Value(heightIn),
      weight: Value(weight),
      age: Value(age),
      bodyFat: Value(bodyFat),
      activityLevel: Value(activityLevel),
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
      avoidFoods: serializer.fromJson<Set<String>>(json['avoidFoods']),
      sex: serializer.fromJson<String>(json['sex']),
      heightFt: serializer.fromJson<String>(json['heightFt']),
      heightIn: serializer.fromJson<String>(json['heightIn']),
      weight: serializer.fromJson<String>(json['weight']),
      age: serializer.fromJson<String>(json['age']),
      bodyFat: serializer.fromJson<String>(json['bodyFat']),
      activityLevel: serializer.fromJson<String>(json['activityLevel']),
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
      'avoidFoods': serializer.toJson<Set<String>>(avoidFoods),
      'sex': serializer.toJson<String>(sex),
      'heightFt': serializer.toJson<String>(heightFt),
      'heightIn': serializer.toJson<String>(heightIn),
      'weight': serializer.toJson<String>(weight),
      'age': serializer.toJson<String>(age),
      'bodyFat': serializer.toJson<String>(bodyFat),
      'activityLevel': serializer.toJson<String>(activityLevel),
    };
  }

  UserInfoData copyWith(
          {int? id,
          String? preferredDiet,
          String? preferredUnits,
          String? goal,
          Set<String>? avoidFoods,
          String? sex,
          String? heightFt,
          String? heightIn,
          String? weight,
          String? age,
          String? bodyFat,
          String? activityLevel}) =>
      UserInfoData(
        id: id ?? this.id,
        preferredDiet: preferredDiet ?? this.preferredDiet,
        preferredUnits: preferredUnits ?? this.preferredUnits,
        goal: goal ?? this.goal,
        avoidFoods: avoidFoods ?? this.avoidFoods,
        sex: sex ?? this.sex,
        heightFt: heightFt ?? this.heightFt,
        heightIn: heightIn ?? this.heightIn,
        weight: weight ?? this.weight,
        age: age ?? this.age,
        bodyFat: bodyFat ?? this.bodyFat,
        activityLevel: activityLevel ?? this.activityLevel,
      );
  @override
  String toString() {
    return (StringBuffer('UserInfoData(')
          ..write('id: $id, ')
          ..write('preferredDiet: $preferredDiet, ')
          ..write('preferredUnits: $preferredUnits, ')
          ..write('goal: $goal, ')
          ..write('avoidFoods: $avoidFoods, ')
          ..write('sex: $sex, ')
          ..write('heightFt: $heightFt, ')
          ..write('heightIn: $heightIn, ')
          ..write('weight: $weight, ')
          ..write('age: $age, ')
          ..write('bodyFat: $bodyFat, ')
          ..write('activityLevel: $activityLevel')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, preferredDiet, preferredUnits, goal,
      avoidFoods, sex, heightFt, heightIn, weight, age, bodyFat, activityLevel);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserInfoData &&
          other.id == this.id &&
          other.preferredDiet == this.preferredDiet &&
          other.preferredUnits == this.preferredUnits &&
          other.goal == this.goal &&
          other.avoidFoods == this.avoidFoods &&
          other.sex == this.sex &&
          other.heightFt == this.heightFt &&
          other.heightIn == this.heightIn &&
          other.weight == this.weight &&
          other.age == this.age &&
          other.bodyFat == this.bodyFat &&
          other.activityLevel == this.activityLevel);
}

class UserInfoCompanion extends UpdateCompanion<UserInfoData> {
  final Value<int> id;
  final Value<String> preferredDiet;
  final Value<String> preferredUnits;
  final Value<String> goal;
  final Value<Set<String>> avoidFoods;
  final Value<String> sex;
  final Value<String> heightFt;
  final Value<String> heightIn;
  final Value<String> weight;
  final Value<String> age;
  final Value<String> bodyFat;
  final Value<String> activityLevel;
  const UserInfoCompanion({
    this.id = const Value.absent(),
    this.preferredDiet = const Value.absent(),
    this.preferredUnits = const Value.absent(),
    this.goal = const Value.absent(),
    this.avoidFoods = const Value.absent(),
    this.sex = const Value.absent(),
    this.heightFt = const Value.absent(),
    this.heightIn = const Value.absent(),
    this.weight = const Value.absent(),
    this.age = const Value.absent(),
    this.bodyFat = const Value.absent(),
    this.activityLevel = const Value.absent(),
  });
  UserInfoCompanion.insert({
    this.id = const Value.absent(),
    required String preferredDiet,
    required String preferredUnits,
    required String goal,
    required Set<String> avoidFoods,
    required String sex,
    required String heightFt,
    required String heightIn,
    required String weight,
    required String age,
    required String bodyFat,
    required String activityLevel,
  })  : preferredDiet = Value(preferredDiet),
        preferredUnits = Value(preferredUnits),
        goal = Value(goal),
        avoidFoods = Value(avoidFoods),
        sex = Value(sex),
        heightFt = Value(heightFt),
        heightIn = Value(heightIn),
        weight = Value(weight),
        age = Value(age),
        bodyFat = Value(bodyFat),
        activityLevel = Value(activityLevel);
  static Insertable<UserInfoData> custom({
    Expression<int>? id,
    Expression<String>? preferredDiet,
    Expression<String>? preferredUnits,
    Expression<String>? goal,
    Expression<String>? avoidFoods,
    Expression<String>? sex,
    Expression<String>? heightFt,
    Expression<String>? heightIn,
    Expression<String>? weight,
    Expression<String>? age,
    Expression<String>? bodyFat,
    Expression<String>? activityLevel,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (preferredDiet != null) 'preferred_diet': preferredDiet,
      if (preferredUnits != null) 'preferred_units': preferredUnits,
      if (goal != null) 'goal': goal,
      if (avoidFoods != null) 'avoid_foods': avoidFoods,
      if (sex != null) 'sex': sex,
      if (heightFt != null) 'height_ft': heightFt,
      if (heightIn != null) 'height_in': heightIn,
      if (weight != null) 'weight': weight,
      if (age != null) 'age': age,
      if (bodyFat != null) 'body_fat': bodyFat,
      if (activityLevel != null) 'activity_level': activityLevel,
    });
  }

  UserInfoCompanion copyWith(
      {Value<int>? id,
      Value<String>? preferredDiet,
      Value<String>? preferredUnits,
      Value<String>? goal,
      Value<Set<String>>? avoidFoods,
      Value<String>? sex,
      Value<String>? heightFt,
      Value<String>? heightIn,
      Value<String>? weight,
      Value<String>? age,
      Value<String>? bodyFat,
      Value<String>? activityLevel}) {
    return UserInfoCompanion(
      id: id ?? this.id,
      preferredDiet: preferredDiet ?? this.preferredDiet,
      preferredUnits: preferredUnits ?? this.preferredUnits,
      goal: goal ?? this.goal,
      avoidFoods: avoidFoods ?? this.avoidFoods,
      sex: sex ?? this.sex,
      heightFt: heightFt ?? this.heightFt,
      heightIn: heightIn ?? this.heightIn,
      weight: weight ?? this.weight,
      age: age ?? this.age,
      bodyFat: bodyFat ?? this.bodyFat,
      activityLevel: activityLevel ?? this.activityLevel,
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
    if (avoidFoods.present) {
      map['avoid_foods'] = Variable<String>(
          $UserInfoTable.$converteravoidFoods.toSql(avoidFoods.value));
    }
    if (sex.present) {
      map['sex'] = Variable<String>(sex.value);
    }
    if (heightFt.present) {
      map['height_ft'] = Variable<String>(heightFt.value);
    }
    if (heightIn.present) {
      map['height_in'] = Variable<String>(heightIn.value);
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
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserInfoCompanion(')
          ..write('id: $id, ')
          ..write('preferredDiet: $preferredDiet, ')
          ..write('preferredUnits: $preferredUnits, ')
          ..write('goal: $goal, ')
          ..write('avoidFoods: $avoidFoods, ')
          ..write('sex: $sex, ')
          ..write('heightFt: $heightFt, ')
          ..write('heightIn: $heightIn, ')
          ..write('weight: $weight, ')
          ..write('age: $age, ')
          ..write('bodyFat: $bodyFat, ')
          ..write('activityLevel: $activityLevel')
          ..write(')'))
        .toString();
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(e);
  _$MyDatabaseManager get managers => _$MyDatabaseManager(this);
  late final $UserInfoTable userInfo = $UserInfoTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [userInfo];
}

typedef $$UserInfoTableInsertCompanionBuilder = UserInfoCompanion Function({
  Value<int> id,
  required String preferredDiet,
  required String preferredUnits,
  required String goal,
  required Set<String> avoidFoods,
  required String sex,
  required String heightFt,
  required String heightIn,
  required String weight,
  required String age,
  required String bodyFat,
  required String activityLevel,
});
typedef $$UserInfoTableUpdateCompanionBuilder = UserInfoCompanion Function({
  Value<int> id,
  Value<String> preferredDiet,
  Value<String> preferredUnits,
  Value<String> goal,
  Value<Set<String>> avoidFoods,
  Value<String> sex,
  Value<String> heightFt,
  Value<String> heightIn,
  Value<String> weight,
  Value<String> age,
  Value<String> bodyFat,
  Value<String> activityLevel,
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
            Value<Set<String>> avoidFoods = const Value.absent(),
            Value<String> sex = const Value.absent(),
            Value<String> heightFt = const Value.absent(),
            Value<String> heightIn = const Value.absent(),
            Value<String> weight = const Value.absent(),
            Value<String> age = const Value.absent(),
            Value<String> bodyFat = const Value.absent(),
            Value<String> activityLevel = const Value.absent(),
          }) =>
              UserInfoCompanion(
            id: id,
            preferredDiet: preferredDiet,
            preferredUnits: preferredUnits,
            goal: goal,
            avoidFoods: avoidFoods,
            sex: sex,
            heightFt: heightFt,
            heightIn: heightIn,
            weight: weight,
            age: age,
            bodyFat: bodyFat,
            activityLevel: activityLevel,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required String preferredDiet,
            required String preferredUnits,
            required String goal,
            required Set<String> avoidFoods,
            required String sex,
            required String heightFt,
            required String heightIn,
            required String weight,
            required String age,
            required String bodyFat,
            required String activityLevel,
          }) =>
              UserInfoCompanion.insert(
            id: id,
            preferredDiet: preferredDiet,
            preferredUnits: preferredUnits,
            goal: goal,
            avoidFoods: avoidFoods,
            sex: sex,
            heightFt: heightFt,
            heightIn: heightIn,
            weight: weight,
            age: age,
            bodyFat: bodyFat,
            activityLevel: activityLevel,
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

  ColumnWithTypeConverterFilters<Set<String>, Set<String>, String>
      get avoidFoods => $state.composableBuilder(
          column: $state.table.avoidFoods,
          builder: (column, joinBuilders) => ColumnWithTypeConverterFilters(
              column,
              joinBuilders: joinBuilders));

  ColumnFilters<String> get sex => $state.composableBuilder(
      column: $state.table.sex,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get heightFt => $state.composableBuilder(
      column: $state.table.heightFt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get heightIn => $state.composableBuilder(
      column: $state.table.heightIn,
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

  ColumnOrderings<String> get avoidFoods => $state.composableBuilder(
      column: $state.table.avoidFoods,
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

  ColumnOrderings<String> get heightIn => $state.composableBuilder(
      column: $state.table.heightIn,
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
}

class _$MyDatabaseManager {
  final _$MyDatabase _db;
  _$MyDatabaseManager(this._db);
  $$UserInfoTableTableManager get userInfo =>
      $$UserInfoTableTableManager(_db, _db.userInfo);
}
