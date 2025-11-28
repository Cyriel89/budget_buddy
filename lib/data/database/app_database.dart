import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import 'tables/account.dart';
import 'tables/category.dart';
import 'tables/transaction.dart';
import 'tables/budget.dart';
import 'daos/account_dao.dart';
import 'daos/category_dao.dart';
import 'daos/transaction_dao.dart';
import 'daos/budget_dao.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [Accounts, Categories, Transactions, Budgets],
  daos: [AccountDao, CategoryDao, TransactionDao, BudgetDao],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 3;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) async {
      await m.createAll();
    },
    onUpgrade: (m, from, to) async {
      if (from < 3) {
        await m.createTable(budgets);
      }
    },
  );
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'budget_buddy.sqlite'));

    return NativeDatabase.createInBackground(file);
  });
}
