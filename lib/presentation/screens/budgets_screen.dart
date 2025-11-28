import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../core/theme/theme_mode_provider.dart';
import '../../data/database/db_providers.dart';
import 'package:budget_buddy/data/database/app_database.dart';
import '../../features/budgets/selected_month_provider.dart';
import '../../features/budgets/budgets_provider.dart';

class BudgetsScreen extends ConsumerWidget {
  const BudgetsScreen({super.key});

  void _showAddBudgetDialog(BuildContext context, WidgetRef ref) {
    final month = ref.read(selectedMonthProvider);
    final dao = ref.read(budgetDaoProvider);

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Ajouter Budget Test'),
        content: Text(
          'Ajouter un budget de 300.0 EUR pour le mois de $month, Catégorie 1 (Dépense) ?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Annuler'),
          ),
          TextButton(
            onPressed: () async {
              try {
                await dao.insertBudget(
                  BudgetsCompanion.insert(
                    month: month,
                    categoryId: 1,
                    plannedAmount: 300.0,
                  ),
                );
                if (!ctx.mounted) return;
                Navigator.of(ctx).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Budget test ajouté !')),
                );
              } catch (e) {
                if (!context.mounted) return;
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text('Erreur: $e')));
              }
            },
            child: const Text('Ajouter'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mode = ref.watch(themeModeProvider);
    final selectedMonth = ref.watch(selectedMonthProvider);
    final budgetsAsync = ref.watch(monthlyBudgetsProvider);

    // Le nom du mois formaté (ex: Novembre 2025)
    final date = DateTime.parse('$selectedMonth-01');
    final formattedMonth = DateFormat('MMMM yyyy', 'fr').format(date);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Budgets'),
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
        onPressed: () => _showAddBudgetDialog(context, ref),
        tooltip: 'Ajouter un Budget Test',
        child: const Icon(Icons.add),
      ),

      body: Column(
        children: [
          // Sélecteur de mois
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed: () => ref
                      .read(selectedMonthProvider.notifier)
                      .goToPreviousMonth(),
                ),
                Text(
                  formattedMonth,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                IconButton(
                  icon: const Icon(Icons.arrow_forward_ios),
                  onPressed: () =>
                      ref.read(selectedMonthProvider.notifier).goToNextMonth(),
                ),
              ],
            ),
          ),

          // Liste des Budgets pour le mois sélectionné
          Expanded(
            child: budgetsAsync.when(
              data: (budgets) {
                if (budgets.isEmpty) {
                  return const Center(
                    child: Text('Aucun budget défini pour ce mois.'),
                  );
                }
                return ListView.builder(
                  itemCount: budgets.length,
                  itemBuilder: (context, index) {
                    final b = budgets[index];
                    // Idéalement, vous voudriez aussi récupérer le nom de la catégorie (Category.name)
                    // mais cela nécessite d'utiliser une Jointure dans Drift ou de lire le CategoryDao séparément.
                    return ListTile(
                      title: Text('Catégorie ID: ${b.categoryId}'),
                      subtitle: Text('Mois: ${b.month}'),
                      trailing: Text(
                        'Prévu: ${b.plannedAmount.toStringAsFixed(2)} €',
                      ),
                      // Vous pouvez ajouter ici la barre de progression (Planned vs Actual)
                    );
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, s) =>
                  Center(child: Text('Erreur chargement budgets: $e')),
            ),
          ),
        ],
      ),
    );
  }
}
