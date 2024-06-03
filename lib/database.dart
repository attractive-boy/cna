import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'database.g.dart';

class UserInfo extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get preferredDiet => text().withLength(min: 1, max: 50)();
  TextColumn get preferredUnits => text().withLength(min: 1, max: 20)();
  TextColumn get goal => text().withLength(min: 1, max: 20)();
  TextColumn get avoidFoods => text().map(const SetConverter())();
  TextColumn get sex => text().withLength(min: 1, max: 10)();
  TextColumn get heightFt => text().withLength(min: 1, max: 5)();
  TextColumn get heightIn => text().withLength(min: 1, max: 5)();
  TextColumn get weight => text().withLength(min: 1, max: 5)();
  TextColumn get age => text().withLength(min: 1, max: 5)();
  TextColumn get bodyFat => text().withLength(min: 1, max: 10)();
  TextColumn get activityLevel => text().withLength(min: 1, max: 50)();
}

@DriftDatabase(tables: [UserInfo])
class MyDatabase extends _$MyDatabase {
  MyDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (Migrator m) async {
      await m.createAll();
    },
    onUpgrade: (Migrator m, int from, int to) async {
      // Put your migration logic here if needed
    },
  );

  Future<List<UserInfoData>> getAllUsers() => select(userInfo).get();

  Future insertUser(UserInfoCompanion user) => into(userInfo).insert(user);

  Future updateUser(UserInfoData user) => update(userInfo).replace(user);

  Future deleteUser(UserInfoData user) => delete(userInfo).delete(user);
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'child_nutrition.db'));
    return NativeDatabase(file);
  });
}

class SetConverter extends TypeConverter<Set<String>, String> {
  const SetConverter();

  @override
  Set<String> fromSql(String fromDb) {
    if (fromDb.isEmpty) {
      return {};
    }
    return fromDb.split(',').toSet();
  }

  @override
  String toSql(Set<String> value) {
    if (value.isEmpty) {
      return '';
    }
    return value.join(',');
  }
}
