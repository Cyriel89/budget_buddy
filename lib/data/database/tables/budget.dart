import 'package:drift/drift.dart';
import 'category.dart';

class Budgets extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get month => text().withLength(min: 7, max: 7)();
  IntColumn get categoryId =>
      integer().named("category_id").references(Categories, #id)();
  RealColumn get plannedAmount => real().named("planned_amount")();
  RealColumn get actualAmount =>
      real().named("actual_amount").withDefault(const Constant(0.0))();
  DateTimeColumn get updatedAt =>
      dateTime().named("updated_at").withDefault(currentDateAndTime)();
  @override
  List<String> get customConstraints => const ['UNIQUE (month, category_id)'];
}
