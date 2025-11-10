import 'package:budget_buddy/core/theme/theme_mode_provider.dart';
import 'package:budget_buddy/data/database/tables/transaction.dart'; // TransactionType
import 'package:budget_buddy/features/accounts/accounts_providers.dart';
import 'package:budget_buddy/features/transactions/selected_account_provider.dart';
import 'package:budget_buddy/features/transactions/transactions_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart' show Value;
import 'package:go_router/go_router.dart';
import 'package:budget_buddy/data/database/app_database.dart';
import '../../data/database/db_providers.dart'; // transactionDaoProvider pour le FAB

class TransactionsScreen extends ConsumerStatefulWidget {
  const TransactionsScreen({super.key});

  @override
  ConsumerState<TransactionsScreen> createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends ConsumerState<TransactionsScreen> {
  /// Mémorise la dernière valeur vue dans l’URL pour éviter de ré-écraser
  /// le provider quand seule l’UI (dropdown) change.
  int? _lastRouteAccountId;

  @override
  Widget build(BuildContext context) {
    final mode = ref.watch(themeModeProvider);
    final qp = GoRouterState.of(context).uri.queryParameters;
    final idStr = qp['accountId'];
    final parsedFromRoute = idStr != null ? int.tryParse(idStr) : null;
    final selectedId = ref.watch(selectedAccountIdProvider);

    if (parsedFromRoute != _lastRouteAccountId) {
      _lastRouteAccountId = parsedFromRoute;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(selectedAccountIdProvider.notifier).set(parsedFromRoute);
      });
    }

    final accountsAsync = ref.watch(accountsStreamProvider); // pour le dropdown
    final txsAsync = ref.watch(
      transactionsForSelectedAccountProvider,
    ); // liste filtrée
    final txDao = ref.watch(transactionDaoProvider); // pour FAB test

    return Scaffold(
      appBar: AppBar(
        title: const Text('Transactions'),
        actions: [
          IconButton(
            tooltip: 'Basculer clair/sombre',
            onPressed: () => ref.read(themeModeProvider.notifier).toggle(),
            icon: Icon(
              mode == ThemeMode.dark ? Icons.dark_mode : Icons.light_mode,
            ),
          ),
          IconButton(
            onPressed: () => context.push('/settings'),
            icon: const Icon(Icons.settings_outlined),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final accountId = ref.read(selectedAccountIdProvider);
          if (accountId == null) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  'Sélectionne un compte pour ajouter une transaction de test.',
                ),
              ),
            );
            return;
          }

          await txDao.insertTransaction(
            TransactionsCompanion.insert(
              date: Value(DateTime.now().subtract(const Duration(days: 2))),
              amount: const Value(-51.53), // dépense
              description: const Value('Jeux vidéo'),
              type: TransactionType.expense,
              accountId: accountId,
              categoryId: const Value(0),
              tags: const Value('Game, hobby'),
              createdAt: Value(DateTime.now()),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),

      body: Column(
        children: [
          // Dropdown "Compte"
          accountsAsync.when(
            data: (accounts) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButton<int?>(
                isExpanded: true,
                value: selectedId, // null => "Tous les comptes"
                items: [
                  const DropdownMenuItem<int?>(
                    value: null,
                    child: Text('Tous les comptes'),
                  ),
                  ...accounts.map(
                    (a) => DropdownMenuItem<int?>(
                      value: a.id,
                      child: Text(a.name),
                    ),
                  ),
                ],
                onChanged: (value) {
                  ref.read(selectedAccountIdProvider.notifier).set(value);
                  final newPath = value == null
                      ? '/transactions'
                      : '/transactions?accountId=$value';
                  _lastRouteAccountId = value;
                  context.go(newPath);
                },
              ),
            ),
            loading: () => const LinearProgressIndicator(),
            error: (e, _) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Erreur chargement comptes: $e'),
            ),
          ),

          // Liste transactions (réagit au provider dérivé)
          Expanded(
            child: txsAsync.when(
              data: (items) {
                if (items.isEmpty) {
                  return const Center(child: Text('Aucune transaction.'));
                }
                return ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final tx = items[index];
                    return ListTile(
                      title: Text(tx.description ?? '—'),
                      subtitle: Text(
                        '${tx.date} • Cat: ${tx.categoryId ?? '-'}',
                      ),
                      trailing: Text(tx.amount.toStringAsFixed(2)),
                    );
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(child: Text('Erreur: $e')),
            ),
          ),
        ],
      ),
    );
  }
}
