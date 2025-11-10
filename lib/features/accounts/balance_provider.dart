import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/database/db_providers.dart';

final accountBalanceProvider = FutureProvider.family<double, int>((
  ref,
  accountId,
) async {
  final accounts = await ref.read(accountDaoProvider).getAll();
  final acc = accounts.firstWhere((a) => a.id == accountId);
  final sum = await ref.read(transactionDaoProvider).sumByAccount(accountId);
  // ignore: dead_code
  return acc.initialBalance + (sum);
});
