import 'package:budget_buddy/features/accounts/balance_provider.dart';
import 'package:budget_buddy/features/accounts/accounts_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart' show Value;
import 'package:go_router/go_router.dart';
import 'package:budget_buddy/data/database/app_database.dart';
import '../../data/database/db_providers.dart'; // accountDaoProvider
import 'package:budget_buddy/data/database/tables/account.dart'; // AccountsCompanion + AccountType

class AccountsScreen extends ConsumerWidget {
  const AccountsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dao = ref.watch(accountDaoProvider);
    // Liste des comptes (provider feature)
    final accountsAsync = ref.watch(accountsStreamProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Comptes')),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await dao.insertAccount(
            AccountsCompanion.insert(
              name: 'Compte courant',
              type: AccountType.checking, // colonne mappée enum
              currency: const Value('EUR'),
              initialBalance: const Value(500.0),
              isArchived: const Value(false),
              colorHex: const Value('4280391411'),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: accountsAsync.when(
        data: (accounts) {
          if (accounts.isEmpty) {
            return const Center(
              child: Text('Aucun compte. Clique + pour en créer un.'),
            );
          }
          return ListView.builder(
            itemCount: accounts.length,
            itemBuilder: (context, i) {
              final a = accounts[i];

              // Solde calculé = provider family, à appeler par compte
              final balanceAsync = ref.watch(accountBalanceProvider(a.id));

              return ListTile(
                title: Text(a.name),
                subtitle: Text('${a.type.name.toUpperCase()} • ${a.currency}'),
                trailing: balanceAsync.when(
                  data: (balance) => Text(balance.toStringAsFixed(2)),
                  loading: () => const SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                  error: (_, _) => const Text('—'),
                ),
                // Navigation: utilise QUERY PARAM pour arriver sur l’onglet Transactions
                onTap: () => context.go('/transactions?accountId=${a.id}'),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Erreur: $e')),
      ),
    );
  }
}
