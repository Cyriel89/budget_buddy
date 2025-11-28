import 'package:drift/drift.dart';
import 'package:budget_buddy/data/database/app_database.dart';
import 'package:budget_buddy/data/database/tables/budget.dart';

part 'budget_dao.g.dart'; // Sera généré par build_runner

@DriftAccessor(tables: [Budgets])
class BudgetDao extends DatabaseAccessor<AppDatabase> with _$BudgetDaoMixin {
  BudgetDao(super.db);

  Future<int> insertBudget(BudgetsCompanion entry) =>
      into(budgets).insert(entry);
  Future<bool> updateBudget(BudgetsCompanion entry) =>
      update(budgets).replace(entry);
  Stream<List<Budget>> watchMonthlyBudgets(String month) =>
      (select(budgets)
            ..where((b) => b.month.equals(month))
            ..orderBy([(b) => OrderingTerm.asc(b.categoryId)]))
          .watch();
  Future<Budget?> getBudgetByMonthAndCategory(String month, int categoryId) =>
      (select(budgets)
            ..where((b) => b.month.equals(month))
            ..where((b) => b.categoryId.equals(categoryId)))
          .getSingleOrNull();
  Future<int> deleteById(int id) =>
      (delete(budgets)..where((t) => t.id.equals(id))).go();
}
