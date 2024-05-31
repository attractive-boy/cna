// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $ChildrenTable extends Children with TableInfo<$ChildrenTable, Child> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ChildrenTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _ageMeta = const VerificationMeta('age');
  @override
  late final GeneratedColumn<int> age = GeneratedColumn<int>(
      'age', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _weightMeta = const VerificationMeta('weight');
  @override
  late final GeneratedColumn<double> weight = GeneratedColumn<double>(
      'weight', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _healthStatusMeta =
      const VerificationMeta('healthStatus');
  @override
  late final GeneratedColumn<String> healthStatus = GeneratedColumn<String>(
      'health_status', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _specialNeedsMeta =
      const VerificationMeta('specialNeeds');
  @override
  late final GeneratedColumn<String> specialNeeds = GeneratedColumn<String>(
      'special_needs', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, age, weight, healthStatus, specialNeeds];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'children';
  @override
  VerificationContext validateIntegrity(Insertable<Child> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('age')) {
      context.handle(
          _ageMeta, age.isAcceptableOrUnknown(data['age']!, _ageMeta));
    } else if (isInserting) {
      context.missing(_ageMeta);
    }
    if (data.containsKey('weight')) {
      context.handle(_weightMeta,
          weight.isAcceptableOrUnknown(data['weight']!, _weightMeta));
    } else if (isInserting) {
      context.missing(_weightMeta);
    }
    if (data.containsKey('health_status')) {
      context.handle(
          _healthStatusMeta,
          healthStatus.isAcceptableOrUnknown(
              data['health_status']!, _healthStatusMeta));
    }
    if (data.containsKey('special_needs')) {
      context.handle(
          _specialNeedsMeta,
          specialNeeds.isAcceptableOrUnknown(
              data['special_needs']!, _specialNeedsMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Child map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Child(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      age: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}age'])!,
      weight: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}weight'])!,
      healthStatus: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}health_status']),
      specialNeeds: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}special_needs']),
    );
  }

  @override
  $ChildrenTable createAlias(String alias) {
    return $ChildrenTable(attachedDatabase, alias);
  }
}

class Child extends DataClass implements Insertable<Child> {
  final int id;
  final String name;
  final int age;
  final double weight;
  final String? healthStatus;
  final String? specialNeeds;
  const Child(
      {required this.id,
      required this.name,
      required this.age,
      required this.weight,
      this.healthStatus,
      this.specialNeeds});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['age'] = Variable<int>(age);
    map['weight'] = Variable<double>(weight);
    if (!nullToAbsent || healthStatus != null) {
      map['health_status'] = Variable<String>(healthStatus);
    }
    if (!nullToAbsent || specialNeeds != null) {
      map['special_needs'] = Variable<String>(specialNeeds);
    }
    return map;
  }

  ChildrenCompanion toCompanion(bool nullToAbsent) {
    return ChildrenCompanion(
      id: Value(id),
      name: Value(name),
      age: Value(age),
      weight: Value(weight),
      healthStatus: healthStatus == null && nullToAbsent
          ? const Value.absent()
          : Value(healthStatus),
      specialNeeds: specialNeeds == null && nullToAbsent
          ? const Value.absent()
          : Value(specialNeeds),
    );
  }

  factory Child.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Child(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      age: serializer.fromJson<int>(json['age']),
      weight: serializer.fromJson<double>(json['weight']),
      healthStatus: serializer.fromJson<String?>(json['healthStatus']),
      specialNeeds: serializer.fromJson<String?>(json['specialNeeds']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'age': serializer.toJson<int>(age),
      'weight': serializer.toJson<double>(weight),
      'healthStatus': serializer.toJson<String?>(healthStatus),
      'specialNeeds': serializer.toJson<String?>(specialNeeds),
    };
  }

  Child copyWith(
          {int? id,
          String? name,
          int? age,
          double? weight,
          Value<String?> healthStatus = const Value.absent(),
          Value<String?> specialNeeds = const Value.absent()}) =>
      Child(
        id: id ?? this.id,
        name: name ?? this.name,
        age: age ?? this.age,
        weight: weight ?? this.weight,
        healthStatus:
            healthStatus.present ? healthStatus.value : this.healthStatus,
        specialNeeds:
            specialNeeds.present ? specialNeeds.value : this.specialNeeds,
      );
  @override
  String toString() {
    return (StringBuffer('Child(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('age: $age, ')
          ..write('weight: $weight, ')
          ..write('healthStatus: $healthStatus, ')
          ..write('specialNeeds: $specialNeeds')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, age, weight, healthStatus, specialNeeds);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Child &&
          other.id == this.id &&
          other.name == this.name &&
          other.age == this.age &&
          other.weight == this.weight &&
          other.healthStatus == this.healthStatus &&
          other.specialNeeds == this.specialNeeds);
}

class ChildrenCompanion extends UpdateCompanion<Child> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> age;
  final Value<double> weight;
  final Value<String?> healthStatus;
  final Value<String?> specialNeeds;
  const ChildrenCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.age = const Value.absent(),
    this.weight = const Value.absent(),
    this.healthStatus = const Value.absent(),
    this.specialNeeds = const Value.absent(),
  });
  ChildrenCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int age,
    required double weight,
    this.healthStatus = const Value.absent(),
    this.specialNeeds = const Value.absent(),
  })  : name = Value(name),
        age = Value(age),
        weight = Value(weight);
  static Insertable<Child> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? age,
    Expression<double>? weight,
    Expression<String>? healthStatus,
    Expression<String>? specialNeeds,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (age != null) 'age': age,
      if (weight != null) 'weight': weight,
      if (healthStatus != null) 'health_status': healthStatus,
      if (specialNeeds != null) 'special_needs': specialNeeds,
    });
  }

  ChildrenCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<int>? age,
      Value<double>? weight,
      Value<String?>? healthStatus,
      Value<String?>? specialNeeds}) {
    return ChildrenCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      age: age ?? this.age,
      weight: weight ?? this.weight,
      healthStatus: healthStatus ?? this.healthStatus,
      specialNeeds: specialNeeds ?? this.specialNeeds,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (age.present) {
      map['age'] = Variable<int>(age.value);
    }
    if (weight.present) {
      map['weight'] = Variable<double>(weight.value);
    }
    if (healthStatus.present) {
      map['health_status'] = Variable<String>(healthStatus.value);
    }
    if (specialNeeds.present) {
      map['special_needs'] = Variable<String>(specialNeeds.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ChildrenCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('age: $age, ')
          ..write('weight: $weight, ')
          ..write('healthStatus: $healthStatus, ')
          ..write('specialNeeds: $specialNeeds')
          ..write(')'))
        .toString();
  }
}

class $FeedingPlansTable extends FeedingPlans
    with TableInfo<$FeedingPlansTable, FeedingPlan> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FeedingPlansTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _childIdMeta =
      const VerificationMeta('childId');
  @override
  late final GeneratedColumn<int> childId = GeneratedColumn<int>(
      'child_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'REFERENCES children(id)');
  static const VerificationMeta _mealMeta = const VerificationMeta('meal');
  @override
  late final GeneratedColumn<String> meal = GeneratedColumn<String>(
      'meal', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _timeMeta = const VerificationMeta('time');
  @override
  late final GeneratedColumn<String> time = GeneratedColumn<String>(
      'time', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _detailsMeta =
      const VerificationMeta('details');
  @override
  late final GeneratedColumn<String> details = GeneratedColumn<String>(
      'details', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, childId, meal, time, details];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'feeding_plans';
  @override
  VerificationContext validateIntegrity(Insertable<FeedingPlan> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('child_id')) {
      context.handle(_childIdMeta,
          childId.isAcceptableOrUnknown(data['child_id']!, _childIdMeta));
    } else if (isInserting) {
      context.missing(_childIdMeta);
    }
    if (data.containsKey('meal')) {
      context.handle(
          _mealMeta, meal.isAcceptableOrUnknown(data['meal']!, _mealMeta));
    } else if (isInserting) {
      context.missing(_mealMeta);
    }
    if (data.containsKey('time')) {
      context.handle(
          _timeMeta, time.isAcceptableOrUnknown(data['time']!, _timeMeta));
    } else if (isInserting) {
      context.missing(_timeMeta);
    }
    if (data.containsKey('details')) {
      context.handle(_detailsMeta,
          details.isAcceptableOrUnknown(data['details']!, _detailsMeta));
    } else if (isInserting) {
      context.missing(_detailsMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FeedingPlan map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FeedingPlan(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      childId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}child_id'])!,
      meal: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}meal'])!,
      time: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}time'])!,
      details: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}details'])!,
    );
  }

  @override
  $FeedingPlansTable createAlias(String alias) {
    return $FeedingPlansTable(attachedDatabase, alias);
  }
}

class FeedingPlan extends DataClass implements Insertable<FeedingPlan> {
  final int id;
  final int childId;
  final String meal;
  final String time;
  final String details;
  const FeedingPlan(
      {required this.id,
      required this.childId,
      required this.meal,
      required this.time,
      required this.details});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['child_id'] = Variable<int>(childId);
    map['meal'] = Variable<String>(meal);
    map['time'] = Variable<String>(time);
    map['details'] = Variable<String>(details);
    return map;
  }

  FeedingPlansCompanion toCompanion(bool nullToAbsent) {
    return FeedingPlansCompanion(
      id: Value(id),
      childId: Value(childId),
      meal: Value(meal),
      time: Value(time),
      details: Value(details),
    );
  }

  factory FeedingPlan.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FeedingPlan(
      id: serializer.fromJson<int>(json['id']),
      childId: serializer.fromJson<int>(json['childId']),
      meal: serializer.fromJson<String>(json['meal']),
      time: serializer.fromJson<String>(json['time']),
      details: serializer.fromJson<String>(json['details']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'childId': serializer.toJson<int>(childId),
      'meal': serializer.toJson<String>(meal),
      'time': serializer.toJson<String>(time),
      'details': serializer.toJson<String>(details),
    };
  }

  FeedingPlan copyWith(
          {int? id,
          int? childId,
          String? meal,
          String? time,
          String? details}) =>
      FeedingPlan(
        id: id ?? this.id,
        childId: childId ?? this.childId,
        meal: meal ?? this.meal,
        time: time ?? this.time,
        details: details ?? this.details,
      );
  @override
  String toString() {
    return (StringBuffer('FeedingPlan(')
          ..write('id: $id, ')
          ..write('childId: $childId, ')
          ..write('meal: $meal, ')
          ..write('time: $time, ')
          ..write('details: $details')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, childId, meal, time, details);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FeedingPlan &&
          other.id == this.id &&
          other.childId == this.childId &&
          other.meal == this.meal &&
          other.time == this.time &&
          other.details == this.details);
}

class FeedingPlansCompanion extends UpdateCompanion<FeedingPlan> {
  final Value<int> id;
  final Value<int> childId;
  final Value<String> meal;
  final Value<String> time;
  final Value<String> details;
  const FeedingPlansCompanion({
    this.id = const Value.absent(),
    this.childId = const Value.absent(),
    this.meal = const Value.absent(),
    this.time = const Value.absent(),
    this.details = const Value.absent(),
  });
  FeedingPlansCompanion.insert({
    this.id = const Value.absent(),
    required int childId,
    required String meal,
    required String time,
    required String details,
  })  : childId = Value(childId),
        meal = Value(meal),
        time = Value(time),
        details = Value(details);
  static Insertable<FeedingPlan> custom({
    Expression<int>? id,
    Expression<int>? childId,
    Expression<String>? meal,
    Expression<String>? time,
    Expression<String>? details,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (childId != null) 'child_id': childId,
      if (meal != null) 'meal': meal,
      if (time != null) 'time': time,
      if (details != null) 'details': details,
    });
  }

  FeedingPlansCompanion copyWith(
      {Value<int>? id,
      Value<int>? childId,
      Value<String>? meal,
      Value<String>? time,
      Value<String>? details}) {
    return FeedingPlansCompanion(
      id: id ?? this.id,
      childId: childId ?? this.childId,
      meal: meal ?? this.meal,
      time: time ?? this.time,
      details: details ?? this.details,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (childId.present) {
      map['child_id'] = Variable<int>(childId.value);
    }
    if (meal.present) {
      map['meal'] = Variable<String>(meal.value);
    }
    if (time.present) {
      map['time'] = Variable<String>(time.value);
    }
    if (details.present) {
      map['details'] = Variable<String>(details.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FeedingPlansCompanion(')
          ..write('id: $id, ')
          ..write('childId: $childId, ')
          ..write('meal: $meal, ')
          ..write('time: $time, ')
          ..write('details: $details')
          ..write(')'))
        .toString();
  }
}

class $LearningModulesTable extends LearningModules
    with TableInfo<$LearningModulesTable, LearningModule> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LearningModulesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _contentMeta =
      const VerificationMeta('content');
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
      'content', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, title, content];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'learning_modules';
  @override
  VerificationContext validateIntegrity(Insertable<LearningModule> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LearningModule map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LearningModule(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      content: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}content'])!,
    );
  }

  @override
  $LearningModulesTable createAlias(String alias) {
    return $LearningModulesTable(attachedDatabase, alias);
  }
}

class LearningModule extends DataClass implements Insertable<LearningModule> {
  final int id;
  final String title;
  final String content;
  const LearningModule(
      {required this.id, required this.title, required this.content});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['content'] = Variable<String>(content);
    return map;
  }

  LearningModulesCompanion toCompanion(bool nullToAbsent) {
    return LearningModulesCompanion(
      id: Value(id),
      title: Value(title),
      content: Value(content),
    );
  }

  factory LearningModule.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LearningModule(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      content: serializer.fromJson<String>(json['content']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'content': serializer.toJson<String>(content),
    };
  }

  LearningModule copyWith({int? id, String? title, String? content}) =>
      LearningModule(
        id: id ?? this.id,
        title: title ?? this.title,
        content: content ?? this.content,
      );
  @override
  String toString() {
    return (StringBuffer('LearningModule(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('content: $content')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, content);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LearningModule &&
          other.id == this.id &&
          other.title == this.title &&
          other.content == this.content);
}

class LearningModulesCompanion extends UpdateCompanion<LearningModule> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> content;
  const LearningModulesCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.content = const Value.absent(),
  });
  LearningModulesCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String content,
  })  : title = Value(title),
        content = Value(content);
  static Insertable<LearningModule> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? content,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (content != null) 'content': content,
    });
  }

  LearningModulesCompanion copyWith(
      {Value<int>? id, Value<String>? title, Value<String>? content}) {
    return LearningModulesCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LearningModulesCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('content: $content')
          ..write(')'))
        .toString();
  }
}

class $CalendarEventsTable extends CalendarEvents
    with TableInfo<$CalendarEventsTable, CalendarEvent> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CalendarEventsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _childIdMeta =
      const VerificationMeta('childId');
  @override
  late final GeneratedColumn<int> childId = GeneratedColumn<int>(
      'child_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'REFERENCES children(id)');
  static const VerificationMeta _eventMeta = const VerificationMeta('event');
  @override
  late final GeneratedColumn<String> event = GeneratedColumn<String>(
      'event', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _eventDateMeta =
      const VerificationMeta('eventDate');
  @override
  late final GeneratedColumn<DateTime> eventDate = GeneratedColumn<DateTime>(
      'event_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, childId, event, eventDate];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'calendar_events';
  @override
  VerificationContext validateIntegrity(Insertable<CalendarEvent> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('child_id')) {
      context.handle(_childIdMeta,
          childId.isAcceptableOrUnknown(data['child_id']!, _childIdMeta));
    } else if (isInserting) {
      context.missing(_childIdMeta);
    }
    if (data.containsKey('event')) {
      context.handle(
          _eventMeta, event.isAcceptableOrUnknown(data['event']!, _eventMeta));
    } else if (isInserting) {
      context.missing(_eventMeta);
    }
    if (data.containsKey('event_date')) {
      context.handle(_eventDateMeta,
          eventDate.isAcceptableOrUnknown(data['event_date']!, _eventDateMeta));
    } else if (isInserting) {
      context.missing(_eventDateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CalendarEvent map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CalendarEvent(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      childId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}child_id'])!,
      event: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}event'])!,
      eventDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}event_date'])!,
    );
  }

  @override
  $CalendarEventsTable createAlias(String alias) {
    return $CalendarEventsTable(attachedDatabase, alias);
  }
}

class CalendarEvent extends DataClass implements Insertable<CalendarEvent> {
  final int id;
  final int childId;
  final String event;
  final DateTime eventDate;
  const CalendarEvent(
      {required this.id,
      required this.childId,
      required this.event,
      required this.eventDate});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['child_id'] = Variable<int>(childId);
    map['event'] = Variable<String>(event);
    map['event_date'] = Variable<DateTime>(eventDate);
    return map;
  }

  CalendarEventsCompanion toCompanion(bool nullToAbsent) {
    return CalendarEventsCompanion(
      id: Value(id),
      childId: Value(childId),
      event: Value(event),
      eventDate: Value(eventDate),
    );
  }

  factory CalendarEvent.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CalendarEvent(
      id: serializer.fromJson<int>(json['id']),
      childId: serializer.fromJson<int>(json['childId']),
      event: serializer.fromJson<String>(json['event']),
      eventDate: serializer.fromJson<DateTime>(json['eventDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'childId': serializer.toJson<int>(childId),
      'event': serializer.toJson<String>(event),
      'eventDate': serializer.toJson<DateTime>(eventDate),
    };
  }

  CalendarEvent copyWith(
          {int? id, int? childId, String? event, DateTime? eventDate}) =>
      CalendarEvent(
        id: id ?? this.id,
        childId: childId ?? this.childId,
        event: event ?? this.event,
        eventDate: eventDate ?? this.eventDate,
      );
  @override
  String toString() {
    return (StringBuffer('CalendarEvent(')
          ..write('id: $id, ')
          ..write('childId: $childId, ')
          ..write('event: $event, ')
          ..write('eventDate: $eventDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, childId, event, eventDate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CalendarEvent &&
          other.id == this.id &&
          other.childId == this.childId &&
          other.event == this.event &&
          other.eventDate == this.eventDate);
}

class CalendarEventsCompanion extends UpdateCompanion<CalendarEvent> {
  final Value<int> id;
  final Value<int> childId;
  final Value<String> event;
  final Value<DateTime> eventDate;
  const CalendarEventsCompanion({
    this.id = const Value.absent(),
    this.childId = const Value.absent(),
    this.event = const Value.absent(),
    this.eventDate = const Value.absent(),
  });
  CalendarEventsCompanion.insert({
    this.id = const Value.absent(),
    required int childId,
    required String event,
    required DateTime eventDate,
  })  : childId = Value(childId),
        event = Value(event),
        eventDate = Value(eventDate);
  static Insertable<CalendarEvent> custom({
    Expression<int>? id,
    Expression<int>? childId,
    Expression<String>? event,
    Expression<DateTime>? eventDate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (childId != null) 'child_id': childId,
      if (event != null) 'event': event,
      if (eventDate != null) 'event_date': eventDate,
    });
  }

  CalendarEventsCompanion copyWith(
      {Value<int>? id,
      Value<int>? childId,
      Value<String>? event,
      Value<DateTime>? eventDate}) {
    return CalendarEventsCompanion(
      id: id ?? this.id,
      childId: childId ?? this.childId,
      event: event ?? this.event,
      eventDate: eventDate ?? this.eventDate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (childId.present) {
      map['child_id'] = Variable<int>(childId.value);
    }
    if (event.present) {
      map['event'] = Variable<String>(event.value);
    }
    if (eventDate.present) {
      map['event_date'] = Variable<DateTime>(eventDate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CalendarEventsCompanion(')
          ..write('id: $id, ')
          ..write('childId: $childId, ')
          ..write('event: $event, ')
          ..write('eventDate: $eventDate')
          ..write(')'))
        .toString();
  }
}

class $ChatbotQueriesTable extends ChatbotQueries
    with TableInfo<$ChatbotQueriesTable, ChatbotQuery> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ChatbotQueriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _queryMeta = const VerificationMeta('query');
  @override
  late final GeneratedColumn<String> query = GeneratedColumn<String>(
      'query', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _responseMeta =
      const VerificationMeta('response');
  @override
  late final GeneratedColumn<String> response = GeneratedColumn<String>(
      'response', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _timestampMeta =
      const VerificationMeta('timestamp');
  @override
  late final GeneratedColumn<DateTime> timestamp = GeneratedColumn<DateTime>(
      'timestamp', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [id, query, response, timestamp];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'chatbot_queries';
  @override
  VerificationContext validateIntegrity(Insertable<ChatbotQuery> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('query')) {
      context.handle(
          _queryMeta, query.isAcceptableOrUnknown(data['query']!, _queryMeta));
    } else if (isInserting) {
      context.missing(_queryMeta);
    }
    if (data.containsKey('response')) {
      context.handle(_responseMeta,
          response.isAcceptableOrUnknown(data['response']!, _responseMeta));
    } else if (isInserting) {
      context.missing(_responseMeta);
    }
    if (data.containsKey('timestamp')) {
      context.handle(_timestampMeta,
          timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ChatbotQuery map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ChatbotQuery(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      query: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}query'])!,
      response: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}response'])!,
      timestamp: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}timestamp'])!,
    );
  }

  @override
  $ChatbotQueriesTable createAlias(String alias) {
    return $ChatbotQueriesTable(attachedDatabase, alias);
  }
}

class ChatbotQuery extends DataClass implements Insertable<ChatbotQuery> {
  final int id;
  final String query;
  final String response;
  final DateTime timestamp;
  const ChatbotQuery(
      {required this.id,
      required this.query,
      required this.response,
      required this.timestamp});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['query'] = Variable<String>(query);
    map['response'] = Variable<String>(response);
    map['timestamp'] = Variable<DateTime>(timestamp);
    return map;
  }

  ChatbotQueriesCompanion toCompanion(bool nullToAbsent) {
    return ChatbotQueriesCompanion(
      id: Value(id),
      query: Value(query),
      response: Value(response),
      timestamp: Value(timestamp),
    );
  }

  factory ChatbotQuery.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ChatbotQuery(
      id: serializer.fromJson<int>(json['id']),
      query: serializer.fromJson<String>(json['query']),
      response: serializer.fromJson<String>(json['response']),
      timestamp: serializer.fromJson<DateTime>(json['timestamp']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'query': serializer.toJson<String>(query),
      'response': serializer.toJson<String>(response),
      'timestamp': serializer.toJson<DateTime>(timestamp),
    };
  }

  ChatbotQuery copyWith(
          {int? id, String? query, String? response, DateTime? timestamp}) =>
      ChatbotQuery(
        id: id ?? this.id,
        query: query ?? this.query,
        response: response ?? this.response,
        timestamp: timestamp ?? this.timestamp,
      );
  @override
  String toString() {
    return (StringBuffer('ChatbotQuery(')
          ..write('id: $id, ')
          ..write('query: $query, ')
          ..write('response: $response, ')
          ..write('timestamp: $timestamp')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, query, response, timestamp);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ChatbotQuery &&
          other.id == this.id &&
          other.query == this.query &&
          other.response == this.response &&
          other.timestamp == this.timestamp);
}

class ChatbotQueriesCompanion extends UpdateCompanion<ChatbotQuery> {
  final Value<int> id;
  final Value<String> query;
  final Value<String> response;
  final Value<DateTime> timestamp;
  const ChatbotQueriesCompanion({
    this.id = const Value.absent(),
    this.query = const Value.absent(),
    this.response = const Value.absent(),
    this.timestamp = const Value.absent(),
  });
  ChatbotQueriesCompanion.insert({
    this.id = const Value.absent(),
    required String query,
    required String response,
    this.timestamp = const Value.absent(),
  })  : query = Value(query),
        response = Value(response);
  static Insertable<ChatbotQuery> custom({
    Expression<int>? id,
    Expression<String>? query,
    Expression<String>? response,
    Expression<DateTime>? timestamp,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (query != null) 'query': query,
      if (response != null) 'response': response,
      if (timestamp != null) 'timestamp': timestamp,
    });
  }

  ChatbotQueriesCompanion copyWith(
      {Value<int>? id,
      Value<String>? query,
      Value<String>? response,
      Value<DateTime>? timestamp}) {
    return ChatbotQueriesCompanion(
      id: id ?? this.id,
      query: query ?? this.query,
      response: response ?? this.response,
      timestamp: timestamp ?? this.timestamp,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (query.present) {
      map['query'] = Variable<String>(query.value);
    }
    if (response.present) {
      map['response'] = Variable<String>(response.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<DateTime>(timestamp.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ChatbotQueriesCompanion(')
          ..write('id: $id, ')
          ..write('query: $query, ')
          ..write('response: $response, ')
          ..write('timestamp: $timestamp')
          ..write(')'))
        .toString();
  }
}

class $FeedbacksTable extends Feedbacks
    with TableInfo<$FeedbacksTable, Feedback> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FeedbacksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _childIdMeta =
      const VerificationMeta('childId');
  @override
  late final GeneratedColumn<int> childId = GeneratedColumn<int>(
      'child_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'REFERENCES children(id)');
  static const VerificationMeta _feedbackMeta =
      const VerificationMeta('feedback');
  @override
  late final GeneratedColumn<String> feedback = GeneratedColumn<String>(
      'feedback', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _timestampMeta =
      const VerificationMeta('timestamp');
  @override
  late final GeneratedColumn<DateTime> timestamp = GeneratedColumn<DateTime>(
      'timestamp', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [id, childId, feedback, timestamp];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'feedbacks';
  @override
  VerificationContext validateIntegrity(Insertable<Feedback> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('child_id')) {
      context.handle(_childIdMeta,
          childId.isAcceptableOrUnknown(data['child_id']!, _childIdMeta));
    } else if (isInserting) {
      context.missing(_childIdMeta);
    }
    if (data.containsKey('feedback')) {
      context.handle(_feedbackMeta,
          feedback.isAcceptableOrUnknown(data['feedback']!, _feedbackMeta));
    } else if (isInserting) {
      context.missing(_feedbackMeta);
    }
    if (data.containsKey('timestamp')) {
      context.handle(_timestampMeta,
          timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Feedback map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Feedback(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      childId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}child_id'])!,
      feedback: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}feedback'])!,
      timestamp: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}timestamp'])!,
    );
  }

  @override
  $FeedbacksTable createAlias(String alias) {
    return $FeedbacksTable(attachedDatabase, alias);
  }
}

class Feedback extends DataClass implements Insertable<Feedback> {
  final int id;
  final int childId;
  final String feedback;
  final DateTime timestamp;
  const Feedback(
      {required this.id,
      required this.childId,
      required this.feedback,
      required this.timestamp});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['child_id'] = Variable<int>(childId);
    map['feedback'] = Variable<String>(feedback);
    map['timestamp'] = Variable<DateTime>(timestamp);
    return map;
  }

  FeedbacksCompanion toCompanion(bool nullToAbsent) {
    return FeedbacksCompanion(
      id: Value(id),
      childId: Value(childId),
      feedback: Value(feedback),
      timestamp: Value(timestamp),
    );
  }

  factory Feedback.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Feedback(
      id: serializer.fromJson<int>(json['id']),
      childId: serializer.fromJson<int>(json['childId']),
      feedback: serializer.fromJson<String>(json['feedback']),
      timestamp: serializer.fromJson<DateTime>(json['timestamp']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'childId': serializer.toJson<int>(childId),
      'feedback': serializer.toJson<String>(feedback),
      'timestamp': serializer.toJson<DateTime>(timestamp),
    };
  }

  Feedback copyWith(
          {int? id, int? childId, String? feedback, DateTime? timestamp}) =>
      Feedback(
        id: id ?? this.id,
        childId: childId ?? this.childId,
        feedback: feedback ?? this.feedback,
        timestamp: timestamp ?? this.timestamp,
      );
  @override
  String toString() {
    return (StringBuffer('Feedback(')
          ..write('id: $id, ')
          ..write('childId: $childId, ')
          ..write('feedback: $feedback, ')
          ..write('timestamp: $timestamp')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, childId, feedback, timestamp);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Feedback &&
          other.id == this.id &&
          other.childId == this.childId &&
          other.feedback == this.feedback &&
          other.timestamp == this.timestamp);
}

class FeedbacksCompanion extends UpdateCompanion<Feedback> {
  final Value<int> id;
  final Value<int> childId;
  final Value<String> feedback;
  final Value<DateTime> timestamp;
  const FeedbacksCompanion({
    this.id = const Value.absent(),
    this.childId = const Value.absent(),
    this.feedback = const Value.absent(),
    this.timestamp = const Value.absent(),
  });
  FeedbacksCompanion.insert({
    this.id = const Value.absent(),
    required int childId,
    required String feedback,
    this.timestamp = const Value.absent(),
  })  : childId = Value(childId),
        feedback = Value(feedback);
  static Insertable<Feedback> custom({
    Expression<int>? id,
    Expression<int>? childId,
    Expression<String>? feedback,
    Expression<DateTime>? timestamp,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (childId != null) 'child_id': childId,
      if (feedback != null) 'feedback': feedback,
      if (timestamp != null) 'timestamp': timestamp,
    });
  }

  FeedbacksCompanion copyWith(
      {Value<int>? id,
      Value<int>? childId,
      Value<String>? feedback,
      Value<DateTime>? timestamp}) {
    return FeedbacksCompanion(
      id: id ?? this.id,
      childId: childId ?? this.childId,
      feedback: feedback ?? this.feedback,
      timestamp: timestamp ?? this.timestamp,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (childId.present) {
      map['child_id'] = Variable<int>(childId.value);
    }
    if (feedback.present) {
      map['feedback'] = Variable<String>(feedback.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<DateTime>(timestamp.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FeedbacksCompanion(')
          ..write('id: $id, ')
          ..write('childId: $childId, ')
          ..write('feedback: $feedback, ')
          ..write('timestamp: $timestamp')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  _$AppDatabaseManager get managers => _$AppDatabaseManager(this);
  late final $ChildrenTable children = $ChildrenTable(this);
  late final $FeedingPlansTable feedingPlans = $FeedingPlansTable(this);
  late final $LearningModulesTable learningModules =
      $LearningModulesTable(this);
  late final $CalendarEventsTable calendarEvents = $CalendarEventsTable(this);
  late final $ChatbotQueriesTable chatbotQueries = $ChatbotQueriesTable(this);
  late final $FeedbacksTable feedbacks = $FeedbacksTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        children,
        feedingPlans,
        learningModules,
        calendarEvents,
        chatbotQueries,
        feedbacks
      ];
}

typedef $$ChildrenTableInsertCompanionBuilder = ChildrenCompanion Function({
  Value<int> id,
  required String name,
  required int age,
  required double weight,
  Value<String?> healthStatus,
  Value<String?> specialNeeds,
});
typedef $$ChildrenTableUpdateCompanionBuilder = ChildrenCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<int> age,
  Value<double> weight,
  Value<String?> healthStatus,
  Value<String?> specialNeeds,
});

class $$ChildrenTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ChildrenTable,
    Child,
    $$ChildrenTableFilterComposer,
    $$ChildrenTableOrderingComposer,
    $$ChildrenTableProcessedTableManager,
    $$ChildrenTableInsertCompanionBuilder,
    $$ChildrenTableUpdateCompanionBuilder> {
  $$ChildrenTableTableManager(_$AppDatabase db, $ChildrenTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$ChildrenTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$ChildrenTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$ChildrenTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<int> age = const Value.absent(),
            Value<double> weight = const Value.absent(),
            Value<String?> healthStatus = const Value.absent(),
            Value<String?> specialNeeds = const Value.absent(),
          }) =>
              ChildrenCompanion(
            id: id,
            name: name,
            age: age,
            weight: weight,
            healthStatus: healthStatus,
            specialNeeds: specialNeeds,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required String name,
            required int age,
            required double weight,
            Value<String?> healthStatus = const Value.absent(),
            Value<String?> specialNeeds = const Value.absent(),
          }) =>
              ChildrenCompanion.insert(
            id: id,
            name: name,
            age: age,
            weight: weight,
            healthStatus: healthStatus,
            specialNeeds: specialNeeds,
          ),
        ));
}

class $$ChildrenTableProcessedTableManager extends ProcessedTableManager<
    _$AppDatabase,
    $ChildrenTable,
    Child,
    $$ChildrenTableFilterComposer,
    $$ChildrenTableOrderingComposer,
    $$ChildrenTableProcessedTableManager,
    $$ChildrenTableInsertCompanionBuilder,
    $$ChildrenTableUpdateCompanionBuilder> {
  $$ChildrenTableProcessedTableManager(super.$state);
}

class $$ChildrenTableFilterComposer
    extends FilterComposer<_$AppDatabase, $ChildrenTable> {
  $$ChildrenTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get age => $state.composableBuilder(
      column: $state.table.age,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get weight => $state.composableBuilder(
      column: $state.table.weight,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get healthStatus => $state.composableBuilder(
      column: $state.table.healthStatus,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get specialNeeds => $state.composableBuilder(
      column: $state.table.specialNeeds,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ComposableFilter feedingPlansRefs(
      ComposableFilter Function($$FeedingPlansTableFilterComposer f) f) {
    final $$FeedingPlansTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.feedingPlans,
        getReferencedColumn: (t) => t.childId,
        builder: (joinBuilder, parentComposers) =>
            $$FeedingPlansTableFilterComposer(ComposerState($state.db,
                $state.db.feedingPlans, joinBuilder, parentComposers)));
    return f(composer);
  }

  ComposableFilter calendarEventsRefs(
      ComposableFilter Function($$CalendarEventsTableFilterComposer f) f) {
    final $$CalendarEventsTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.calendarEvents,
        getReferencedColumn: (t) => t.childId,
        builder: (joinBuilder, parentComposers) =>
            $$CalendarEventsTableFilterComposer(ComposerState($state.db,
                $state.db.calendarEvents, joinBuilder, parentComposers)));
    return f(composer);
  }

  ComposableFilter feedbacksRefs(
      ComposableFilter Function($$FeedbacksTableFilterComposer f) f) {
    final $$FeedbacksTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.feedbacks,
        getReferencedColumn: (t) => t.childId,
        builder: (joinBuilder, parentComposers) =>
            $$FeedbacksTableFilterComposer(ComposerState(
                $state.db, $state.db.feedbacks, joinBuilder, parentComposers)));
    return f(composer);
  }
}

class $$ChildrenTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $ChildrenTable> {
  $$ChildrenTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get age => $state.composableBuilder(
      column: $state.table.age,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get weight => $state.composableBuilder(
      column: $state.table.weight,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get healthStatus => $state.composableBuilder(
      column: $state.table.healthStatus,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get specialNeeds => $state.composableBuilder(
      column: $state.table.specialNeeds,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$FeedingPlansTableInsertCompanionBuilder = FeedingPlansCompanion
    Function({
  Value<int> id,
  required int childId,
  required String meal,
  required String time,
  required String details,
});
typedef $$FeedingPlansTableUpdateCompanionBuilder = FeedingPlansCompanion
    Function({
  Value<int> id,
  Value<int> childId,
  Value<String> meal,
  Value<String> time,
  Value<String> details,
});

class $$FeedingPlansTableTableManager extends RootTableManager<
    _$AppDatabase,
    $FeedingPlansTable,
    FeedingPlan,
    $$FeedingPlansTableFilterComposer,
    $$FeedingPlansTableOrderingComposer,
    $$FeedingPlansTableProcessedTableManager,
    $$FeedingPlansTableInsertCompanionBuilder,
    $$FeedingPlansTableUpdateCompanionBuilder> {
  $$FeedingPlansTableTableManager(_$AppDatabase db, $FeedingPlansTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$FeedingPlansTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$FeedingPlansTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$FeedingPlansTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<int> childId = const Value.absent(),
            Value<String> meal = const Value.absent(),
            Value<String> time = const Value.absent(),
            Value<String> details = const Value.absent(),
          }) =>
              FeedingPlansCompanion(
            id: id,
            childId: childId,
            meal: meal,
            time: time,
            details: details,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required int childId,
            required String meal,
            required String time,
            required String details,
          }) =>
              FeedingPlansCompanion.insert(
            id: id,
            childId: childId,
            meal: meal,
            time: time,
            details: details,
          ),
        ));
}

class $$FeedingPlansTableProcessedTableManager extends ProcessedTableManager<
    _$AppDatabase,
    $FeedingPlansTable,
    FeedingPlan,
    $$FeedingPlansTableFilterComposer,
    $$FeedingPlansTableOrderingComposer,
    $$FeedingPlansTableProcessedTableManager,
    $$FeedingPlansTableInsertCompanionBuilder,
    $$FeedingPlansTableUpdateCompanionBuilder> {
  $$FeedingPlansTableProcessedTableManager(super.$state);
}

class $$FeedingPlansTableFilterComposer
    extends FilterComposer<_$AppDatabase, $FeedingPlansTable> {
  $$FeedingPlansTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get meal => $state.composableBuilder(
      column: $state.table.meal,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get time => $state.composableBuilder(
      column: $state.table.time,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get details => $state.composableBuilder(
      column: $state.table.details,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$ChildrenTableFilterComposer get childId {
    final $$ChildrenTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.childId,
        referencedTable: $state.db.children,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$ChildrenTableFilterComposer(ComposerState(
                $state.db, $state.db.children, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$FeedingPlansTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $FeedingPlansTable> {
  $$FeedingPlansTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get meal => $state.composableBuilder(
      column: $state.table.meal,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get time => $state.composableBuilder(
      column: $state.table.time,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get details => $state.composableBuilder(
      column: $state.table.details,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$ChildrenTableOrderingComposer get childId {
    final $$ChildrenTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.childId,
        referencedTable: $state.db.children,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$ChildrenTableOrderingComposer(ComposerState(
                $state.db, $state.db.children, joinBuilder, parentComposers)));
    return composer;
  }
}

typedef $$LearningModulesTableInsertCompanionBuilder = LearningModulesCompanion
    Function({
  Value<int> id,
  required String title,
  required String content,
});
typedef $$LearningModulesTableUpdateCompanionBuilder = LearningModulesCompanion
    Function({
  Value<int> id,
  Value<String> title,
  Value<String> content,
});

class $$LearningModulesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $LearningModulesTable,
    LearningModule,
    $$LearningModulesTableFilterComposer,
    $$LearningModulesTableOrderingComposer,
    $$LearningModulesTableProcessedTableManager,
    $$LearningModulesTableInsertCompanionBuilder,
    $$LearningModulesTableUpdateCompanionBuilder> {
  $$LearningModulesTableTableManager(
      _$AppDatabase db, $LearningModulesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$LearningModulesTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$LearningModulesTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$LearningModulesTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String> content = const Value.absent(),
          }) =>
              LearningModulesCompanion(
            id: id,
            title: title,
            content: content,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required String title,
            required String content,
          }) =>
              LearningModulesCompanion.insert(
            id: id,
            title: title,
            content: content,
          ),
        ));
}

class $$LearningModulesTableProcessedTableManager extends ProcessedTableManager<
    _$AppDatabase,
    $LearningModulesTable,
    LearningModule,
    $$LearningModulesTableFilterComposer,
    $$LearningModulesTableOrderingComposer,
    $$LearningModulesTableProcessedTableManager,
    $$LearningModulesTableInsertCompanionBuilder,
    $$LearningModulesTableUpdateCompanionBuilder> {
  $$LearningModulesTableProcessedTableManager(super.$state);
}

class $$LearningModulesTableFilterComposer
    extends FilterComposer<_$AppDatabase, $LearningModulesTable> {
  $$LearningModulesTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get title => $state.composableBuilder(
      column: $state.table.title,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get content => $state.composableBuilder(
      column: $state.table.content,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$LearningModulesTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $LearningModulesTable> {
  $$LearningModulesTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get title => $state.composableBuilder(
      column: $state.table.title,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get content => $state.composableBuilder(
      column: $state.table.content,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$CalendarEventsTableInsertCompanionBuilder = CalendarEventsCompanion
    Function({
  Value<int> id,
  required int childId,
  required String event,
  required DateTime eventDate,
});
typedef $$CalendarEventsTableUpdateCompanionBuilder = CalendarEventsCompanion
    Function({
  Value<int> id,
  Value<int> childId,
  Value<String> event,
  Value<DateTime> eventDate,
});

class $$CalendarEventsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CalendarEventsTable,
    CalendarEvent,
    $$CalendarEventsTableFilterComposer,
    $$CalendarEventsTableOrderingComposer,
    $$CalendarEventsTableProcessedTableManager,
    $$CalendarEventsTableInsertCompanionBuilder,
    $$CalendarEventsTableUpdateCompanionBuilder> {
  $$CalendarEventsTableTableManager(
      _$AppDatabase db, $CalendarEventsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$CalendarEventsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$CalendarEventsTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$CalendarEventsTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<int> childId = const Value.absent(),
            Value<String> event = const Value.absent(),
            Value<DateTime> eventDate = const Value.absent(),
          }) =>
              CalendarEventsCompanion(
            id: id,
            childId: childId,
            event: event,
            eventDate: eventDate,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required int childId,
            required String event,
            required DateTime eventDate,
          }) =>
              CalendarEventsCompanion.insert(
            id: id,
            childId: childId,
            event: event,
            eventDate: eventDate,
          ),
        ));
}

class $$CalendarEventsTableProcessedTableManager extends ProcessedTableManager<
    _$AppDatabase,
    $CalendarEventsTable,
    CalendarEvent,
    $$CalendarEventsTableFilterComposer,
    $$CalendarEventsTableOrderingComposer,
    $$CalendarEventsTableProcessedTableManager,
    $$CalendarEventsTableInsertCompanionBuilder,
    $$CalendarEventsTableUpdateCompanionBuilder> {
  $$CalendarEventsTableProcessedTableManager(super.$state);
}

class $$CalendarEventsTableFilterComposer
    extends FilterComposer<_$AppDatabase, $CalendarEventsTable> {
  $$CalendarEventsTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get event => $state.composableBuilder(
      column: $state.table.event,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get eventDate => $state.composableBuilder(
      column: $state.table.eventDate,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$ChildrenTableFilterComposer get childId {
    final $$ChildrenTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.childId,
        referencedTable: $state.db.children,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$ChildrenTableFilterComposer(ComposerState(
                $state.db, $state.db.children, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$CalendarEventsTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $CalendarEventsTable> {
  $$CalendarEventsTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get event => $state.composableBuilder(
      column: $state.table.event,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get eventDate => $state.composableBuilder(
      column: $state.table.eventDate,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$ChildrenTableOrderingComposer get childId {
    final $$ChildrenTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.childId,
        referencedTable: $state.db.children,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$ChildrenTableOrderingComposer(ComposerState(
                $state.db, $state.db.children, joinBuilder, parentComposers)));
    return composer;
  }
}

typedef $$ChatbotQueriesTableInsertCompanionBuilder = ChatbotQueriesCompanion
    Function({
  Value<int> id,
  required String query,
  required String response,
  Value<DateTime> timestamp,
});
typedef $$ChatbotQueriesTableUpdateCompanionBuilder = ChatbotQueriesCompanion
    Function({
  Value<int> id,
  Value<String> query,
  Value<String> response,
  Value<DateTime> timestamp,
});

class $$ChatbotQueriesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ChatbotQueriesTable,
    ChatbotQuery,
    $$ChatbotQueriesTableFilterComposer,
    $$ChatbotQueriesTableOrderingComposer,
    $$ChatbotQueriesTableProcessedTableManager,
    $$ChatbotQueriesTableInsertCompanionBuilder,
    $$ChatbotQueriesTableUpdateCompanionBuilder> {
  $$ChatbotQueriesTableTableManager(
      _$AppDatabase db, $ChatbotQueriesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$ChatbotQueriesTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$ChatbotQueriesTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$ChatbotQueriesTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<String> query = const Value.absent(),
            Value<String> response = const Value.absent(),
            Value<DateTime> timestamp = const Value.absent(),
          }) =>
              ChatbotQueriesCompanion(
            id: id,
            query: query,
            response: response,
            timestamp: timestamp,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required String query,
            required String response,
            Value<DateTime> timestamp = const Value.absent(),
          }) =>
              ChatbotQueriesCompanion.insert(
            id: id,
            query: query,
            response: response,
            timestamp: timestamp,
          ),
        ));
}

class $$ChatbotQueriesTableProcessedTableManager extends ProcessedTableManager<
    _$AppDatabase,
    $ChatbotQueriesTable,
    ChatbotQuery,
    $$ChatbotQueriesTableFilterComposer,
    $$ChatbotQueriesTableOrderingComposer,
    $$ChatbotQueriesTableProcessedTableManager,
    $$ChatbotQueriesTableInsertCompanionBuilder,
    $$ChatbotQueriesTableUpdateCompanionBuilder> {
  $$ChatbotQueriesTableProcessedTableManager(super.$state);
}

class $$ChatbotQueriesTableFilterComposer
    extends FilterComposer<_$AppDatabase, $ChatbotQueriesTable> {
  $$ChatbotQueriesTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get query => $state.composableBuilder(
      column: $state.table.query,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get response => $state.composableBuilder(
      column: $state.table.response,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get timestamp => $state.composableBuilder(
      column: $state.table.timestamp,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$ChatbotQueriesTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $ChatbotQueriesTable> {
  $$ChatbotQueriesTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get query => $state.composableBuilder(
      column: $state.table.query,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get response => $state.composableBuilder(
      column: $state.table.response,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get timestamp => $state.composableBuilder(
      column: $state.table.timestamp,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$FeedbacksTableInsertCompanionBuilder = FeedbacksCompanion Function({
  Value<int> id,
  required int childId,
  required String feedback,
  Value<DateTime> timestamp,
});
typedef $$FeedbacksTableUpdateCompanionBuilder = FeedbacksCompanion Function({
  Value<int> id,
  Value<int> childId,
  Value<String> feedback,
  Value<DateTime> timestamp,
});

class $$FeedbacksTableTableManager extends RootTableManager<
    _$AppDatabase,
    $FeedbacksTable,
    Feedback,
    $$FeedbacksTableFilterComposer,
    $$FeedbacksTableOrderingComposer,
    $$FeedbacksTableProcessedTableManager,
    $$FeedbacksTableInsertCompanionBuilder,
    $$FeedbacksTableUpdateCompanionBuilder> {
  $$FeedbacksTableTableManager(_$AppDatabase db, $FeedbacksTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$FeedbacksTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$FeedbacksTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$FeedbacksTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<int> childId = const Value.absent(),
            Value<String> feedback = const Value.absent(),
            Value<DateTime> timestamp = const Value.absent(),
          }) =>
              FeedbacksCompanion(
            id: id,
            childId: childId,
            feedback: feedback,
            timestamp: timestamp,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required int childId,
            required String feedback,
            Value<DateTime> timestamp = const Value.absent(),
          }) =>
              FeedbacksCompanion.insert(
            id: id,
            childId: childId,
            feedback: feedback,
            timestamp: timestamp,
          ),
        ));
}

class $$FeedbacksTableProcessedTableManager extends ProcessedTableManager<
    _$AppDatabase,
    $FeedbacksTable,
    Feedback,
    $$FeedbacksTableFilterComposer,
    $$FeedbacksTableOrderingComposer,
    $$FeedbacksTableProcessedTableManager,
    $$FeedbacksTableInsertCompanionBuilder,
    $$FeedbacksTableUpdateCompanionBuilder> {
  $$FeedbacksTableProcessedTableManager(super.$state);
}

class $$FeedbacksTableFilterComposer
    extends FilterComposer<_$AppDatabase, $FeedbacksTable> {
  $$FeedbacksTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get feedback => $state.composableBuilder(
      column: $state.table.feedback,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get timestamp => $state.composableBuilder(
      column: $state.table.timestamp,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$ChildrenTableFilterComposer get childId {
    final $$ChildrenTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.childId,
        referencedTable: $state.db.children,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$ChildrenTableFilterComposer(ComposerState(
                $state.db, $state.db.children, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$FeedbacksTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $FeedbacksTable> {
  $$FeedbacksTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get feedback => $state.composableBuilder(
      column: $state.table.feedback,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get timestamp => $state.composableBuilder(
      column: $state.table.timestamp,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$ChildrenTableOrderingComposer get childId {
    final $$ChildrenTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.childId,
        referencedTable: $state.db.children,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$ChildrenTableOrderingComposer(ComposerState(
                $state.db, $state.db.children, joinBuilder, parentComposers)));
    return composer;
  }
}

class _$AppDatabaseManager {
  final _$AppDatabase _db;
  _$AppDatabaseManager(this._db);
  $$ChildrenTableTableManager get children =>
      $$ChildrenTableTableManager(_db, _db.children);
  $$FeedingPlansTableTableManager get feedingPlans =>
      $$FeedingPlansTableTableManager(_db, _db.feedingPlans);
  $$LearningModulesTableTableManager get learningModules =>
      $$LearningModulesTableTableManager(_db, _db.learningModules);
  $$CalendarEventsTableTableManager get calendarEvents =>
      $$CalendarEventsTableTableManager(_db, _db.calendarEvents);
  $$ChatbotQueriesTableTableManager get chatbotQueries =>
      $$ChatbotQueriesTableTableManager(_db, _db.chatbotQueries);
  $$FeedbacksTableTableManager get feedbacks =>
      $$FeedbacksTableTableManager(_db, _db.feedbacks);
}
