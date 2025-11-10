import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:budget_buddy/features/transactions/selected_account_provider.dart';
import 'package:budget_buddy/data/database/db_providers.dart';
import 'package:budget_buddy/data/database/app_database.dart' show Transaction;

final transactionsForSelectedAccountProvider =
    StreamProvider<List<Transaction>>((ref) {
      final dao = ref.watch(transactionDaoProvider);
      final selectedId = ref.watch(selectedAccountIdProvider);
      print('Rebuild stream for accountId: $selectedId');

      if (selectedId == null) {
        return dao.watchAllSorted();
      } else {
        return dao.watchByAccount(selectedId);
      }
    });
