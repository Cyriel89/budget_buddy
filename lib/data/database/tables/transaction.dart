import 'package:budget_buddy/data/database/tables/account.dart';
import 'package:budget_buddy/data/database/tables/category.dart';
import 'package:drift/drift.dart';

enum TransactionType { income, expense, transfer }

@TableIndex(name: 'idx_tx_account_date', columns: {'accountId', 'date'})
@TableIndex(name: 'idx_tx_category', columns: {'categoryId'})
class Transactions extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get date => dateTime().withDefault(currentDateAndTime)();
  RealColumn get amount => real()();
  TextColumn get description => text().nullable()();
  TextColumn get type => text().map(
    const EnumNameConverter<TransactionType>(TransactionType.values),
  )();
  IntColumn get accountId => integer()
      .named("account_id")
      .references(Accounts, #id, onDelete: KeyAction.cascade)();
  IntColumn get categoryId =>
      integer().named("category_id").nullable().references(Categories, #id)();
  TextColumn get tags => text().withDefault(const Constant('[]'))();
  DateTimeColumn get createdAt =>
      dateTime().named("created at").withDefault(currentDateAndTime)();
}
