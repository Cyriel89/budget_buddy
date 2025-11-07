import 'package:budget_buddy/data/database/app_database.dart';
import 'package:budget_buddy/data/database/tables/transaction.dart';
import 'package:drift/drift.dart';

part 'transaction_dao.g.dart';

@DriftAccessor(tables: [Transactions])
class TransactionDao extends DatabaseAccessor<AppDatabase>
    with _$TransactionDaoMixin {
  TransactionDao(super.db);

  Future<int> insertTransaction(TransactionsCompanion entry) =>
      into(transactions).insert(entry);
  Future<List<Transaction>> listByAccount(accountId) =>
      (select(transactions)
            ..where((t) => t.accountId.equals(accountId))
            ..orderBy([(t) => OrderingTerm.desc(t.date)]))
          .get();
  Future<List<Transaction>> listByMonth(int year, int month) {
    final firstDay = DateTime(year, month, 1);
    final lastDay = DateTime(year, month + 1, 0, 23, 59, 59);
    return (select(
      transactions,
    )..where((t) => t.date.isBetweenValues(firstDay, lastDay))).get();
  }

  Future<double> sumByAccount(int accountId, {DateTime? from, DateTime? to}) {
    final query = selectOnly(transactions)
      ..addColumns([transactions.amount.sum()]);
    query.where(transactions.accountId.equals(accountId));
    if (from != null) {
      query.where(transactions.date.isBiggerOrEqualValue(from));
    }
    if (to != null) {
      query.where(transactions.date.isSmallerOrEqualValue(to));
    }
    return query
        .map((row) => row.read(transactions.amount.sum()) ?? 0)
        .getSingle();
  }

  // watchByAccount(accountId)
  Stream<List<Transaction>> watchByAccount(int accountId) => (select(
    transactions,
  )..where((t) => t.accountId.equals(accountId))).watch();
  // watchSumByAccount(...)
  Stream<double> watchSumByAccount(
    int accountId, {
    DateTime? from,
    DateTime? to,
  }) {
    final query = selectOnly(transactions)
      ..addColumns([transactions.amount.sum()]);
    query.where(transactions.accountId.equals(accountId));
    if (from != null) {
      query.where(transactions.date.isBiggerOrEqualValue(from));
    }
    if (to != null) {
      query.where(transactions.date.isSmallerOrEqualValue(to));
    }
    return query
        .map((row) => row.read(transactions.amount.sum()) ?? 0)
        .watchSingle();
  }

  Future<int> deleteById(int id) =>
      (delete(transactions)..where((t) => t.id.equals(id))).go();
}
