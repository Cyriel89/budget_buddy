import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/database/app_database.dart' show Budget;
import '../../data/database/db_providers.dart';
import 'selected_month_provider.dart';

final monthlyBudgetsProvider = StreamProvider<List<Budget>>((ref) {
  final dao = ref.watch(budgetDaoProvider);
  final selectedMonth = ref.watch(selectedMonthProvider);
  return dao.watchMonthlyBudgets(selectedMonth);
});
