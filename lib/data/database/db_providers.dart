import 'package:budget_buddy/data/database/app_database.dart';
import 'package:budget_buddy/data/database/daos/account_dao.dart';
import 'package:budget_buddy/data/database/daos/category_dao.dart';
import 'package:budget_buddy/data/database/daos/transaction_dao.dart';
import 'package:budget_buddy/data/database/daos/budget_dao.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AccountWithBalance {
  final Account account;
  final double balance;

  AccountWithBalance({required this.account, required this.balance});
}

final databaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase();
  ref.onDispose(() => db.close());
  return db;
});

final accountDaoProvider = Provider<AccountDao>(
  (ref) => AccountDao(ref.read(databaseProvider)),
);
final categoryDaoProvider = Provider<CategoryDao>(
  (ref) => CategoryDao(ref.read(databaseProvider)),
);
final transactionDaoProvider = Provider<TransactionDao>(
  (ref) => TransactionDao(ref.read(databaseProvider)),
);
final budgetDaoProvider = Provider<BudgetDao>(
  (ref) => BudgetDao(ref.read(databaseProvider)),
);
