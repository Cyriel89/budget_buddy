import 'package:budget_buddy/data/database/app_database.dart';
import 'package:budget_buddy/data/database/tables/account.dart';
import 'package:drift/drift.dart';

part 'account_dao.g.dart';

@DriftAccessor(tables: [Accounts])
class AccountDao extends DatabaseAccessor<AppDatabase> with _$AccountDaoMixin {
  AccountDao(super.db);

  Future<int> insertAccount(AccountsCompanion entry) =>
      into(accounts).insert(entry);
  Future<List<Account>> getAll() => select(accounts).get();
  Stream<List<Account>> watchAll() => select(accounts).watch();
  Future<int> deleteById(int id) =>
      (delete(accounts)..where((t) => t.id.equals(id))).go();
}
