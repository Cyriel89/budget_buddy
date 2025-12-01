import 'package:drift/drift.dart';
import 'account.dart';
import 'category.dart';

enum RecurringFrequency { daily, weekly, monthly, yearly }

class Recurrings extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get frequency => text().map(
    const EnumNameConverter<RecurringFrequency>(RecurringFrequency.values),
  )();
  DateTimeColumn get nextDate => dateTime()();
  DateTimeColumn get endDate => dateTime().nullable()();
  RealColumn get amount => real().withDefault(const Constant(0.0))();
  TextColumn get description => text().nullable()();
  IntColumn get accountId => integer()
      .named("account_id")
      .references(Accounts, #id, onDelete: KeyAction.cascade)();
  IntColumn get categoryId =>
      integer().named("category_id").nullable().references(Categories, #id)();
}
