import 'package:budget_buddy/data/database/app_database.dart';
import 'package:budget_buddy/data/database/tables/account.dart';
import 'package:drift/drift.dart';

part 'account_dao.g.dart';

@DriftAccessor(tables: [Account])
class AccountDao extends DatabaseAccessor<AppDatabase> with _$AccountDaoMixin {
  AccountDao(super.db);

  Future<int> insertAccount(AccountCompanion entry) =>
      into(account).insert(entry);
  Future<List<AccountData>> getAll() => select(account).get();
  Stream<List<AccountData>> watchAll() => select(account).watch();
  Future<int> deleteById(int id) =>
      (delete(account)..where((t) => t.id.equals(id))).go();
}
