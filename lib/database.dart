import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'database.g.dart';

@DataClassName('Child')
class Children extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  IntColumn get age => integer()();
  RealColumn get weight => real()();
  TextColumn get healthStatus => text().nullable()();
  TextColumn get specialNeeds => text().nullable()();
}

@DataClassName('FeedingPlan')
class FeedingPlans extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get childId =>
      integer().customConstraint('REFERENCES children(id)')();
  TextColumn get meal => text()();
  TextColumn get time => text()();
  TextColumn get details => text()();
}

@DataClassName('LearningModule')
class LearningModules extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get content => text()();
}

@DataClassName('CalendarEvent')
class CalendarEvents extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get childId =>
      integer().customConstraint('REFERENCES children(id)')();
  TextColumn get event => text()();
  DateTimeColumn get eventDate => dateTime()();
}

@DataClassName('ChatbotQuery')
class ChatbotQueries extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get query => text()();
  TextColumn get response => text()();
  DateTimeColumn get timestamp => dateTime().withDefault(currentDateAndTime)();
}

@DataClassName('Feedback')
class Feedbacks extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get childId =>
      integer().customConstraint('REFERENCES children(id)')();
  TextColumn get feedback => text()();
  DateTimeColumn get timestamp => dateTime().withDefault(currentDateAndTime)();
}

@DriftDatabase(tables: [
  Children,
  FeedingPlans,
  LearningModules,
  CalendarEvents,
  ChatbotQueries,
  Feedbacks
])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  // Children table operations
  Future<List<Child>> getAllChildren() => select(children).get();
  Future<int> insertChild(ChildrenCompanion child) =>
      into(children).insert(child);

  // FeedingPlans table operations
  Future<List<FeedingPlan>> getFeedingPlansForChild(int childId) {
    return (select(feedingPlans)..where((tbl) => tbl.childId.equals(childId)))
        .get();
  }

  Future<int> insertFeedingPlan(FeedingPlansCompanion plan) =>
      into(feedingPlans).insert(plan);

  // LearningModules table operations
  Future<List<LearningModule>> getAllLearningModules() =>
      select(learningModules).get();
  Future<int> insertLearningModule(LearningModulesCompanion module) =>
      into(learningModules).insert(module);

  // CalendarEvents table operations
  Future<List<CalendarEvent>> getCalendarEventsForChild(int childId) {
    return (select(calendarEvents)..where((tbl) => tbl.childId.equals(childId)))
        .get();
  }

  Future<int> insertCalendarEvent(CalendarEventsCompanion event) =>
      into(calendarEvents).insert(event);

  // ChatbotQueries table operations
  Future<List<ChatbotQuery>> getAllChatbotQueries() =>
      select(chatbotQueries).get();
  Future<int> insertChatbotQuery(ChatbotQueriesCompanion query) =>
      into(chatbotQueries).insert(query);

  // Feedback table operations
  Future<List<Feedback>> getFeedbacksForChild(int childId) {
    return (select(feedbacks)..where((tbl) => tbl.childId.equals(childId)))
        .get();
  }

  Future<int> insertFeedback(FeedbacksCompanion feedback) =>
      into(feedbacks).insert(feedback);
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'child_nutrition.db'));
    return NativeDatabase(file);
  });
}
