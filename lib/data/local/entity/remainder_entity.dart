import 'package:drift/drift.dart';

class Remainders extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  IntColumn get isCompleted => integer()(); // 0 is false and 1 is true
  IntColumn get userId => integer()();
  DateTimeColumn get createdAt => dateTime()();
}
