import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart';
import '../../data/database/db_providers.dart';
import 'package:budget_buddy/data/database/tables/account.dart';
import 'package:budget_buddy/data/database/app_database.dart';

class AccountsScreen extends ConsumerWidget {
  const AccountsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dao = ref.watch(accountDaoProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Comptes')),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await dao.insertAccount(
            AccountsCompanion.insert(
              name: 'Compte courant',
              type: AccountType.checking,
              currency: Value('EUR'),
              initialBalance: Value(500.0),
              isArchived: Value(false),
              colorHex: Value('4280391411'),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: StreamBuilder(
        stream: dao.watchAll(),
        builder: (context, snapshot) {
          final items = snapshot.data ?? [];
          if (items.isEmpty) {
            return const Center(
              child: Text('Aucun compte. Clique + pour en créer un.'),
            );
          }
          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, i) {
              final a = items[i];
              return ListTile(
                title: Text(a.name),
                subtitle: Text('${a.type.name.toUpperCase()} • ${a.currency}'),
                trailing: Text(a.initialBalance.toStringAsFixed(2)),
              );
            },
          );
        },
      ),
    );
  }
}
