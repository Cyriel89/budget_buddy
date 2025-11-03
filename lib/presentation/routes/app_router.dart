import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../screens/accounts_screen.dart';
import '../screens/budgets_screen.dart';
import '../screens/dashboard_screen.dart';
import '../screens/stats_screen.dart';
import '../screens/transactions_screen.dart';
import '../screens/settings_screen.dart';

class ShellScaffold extends StatefulWidget {
  const ShellScaffold({super.key, required this.navigationShell});
  final StatefulNavigationShell navigationShell;
  @override
  State<ShellScaffold> createState() => _ShellScaffoldState();
}

class _ShellScaffoldState extends State<ShellScaffold> {
  int get _index => widget.navigationShell.currentIndex;
  void _onTap(int idx) => widget.navigationShell.goBranch(idx);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: _onTap,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.dashboard_outlined),
            label: 'Dashboard',
          ),
          NavigationDestination(
            icon: Icon(Icons.account_balance_wallet_outlined),
            label: 'Comptes',
          ),
          NavigationDestination(
            icon: Icon(Icons.receipt_long_outlined),
            label: 'Transactions',
          ),
          NavigationDestination(
            icon: Icon(Icons.wallet_outlined),
            label: 'Budgets',
          ),
          NavigationDestination(
            icon: Icon(Icons.insights_outlined),
            label: 'Stats',
          ),
        ],
      ),
    );
  }
}

final appRouter = GoRouter(
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navShell) =>
          ShellScaffold(navigationShell: navShell),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(path: '/', builder: (c, s) => const DashboardScreen()),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/accounts',
              builder: (c, s) => const AccountsScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/transactions',
              builder: (c, s) => const TransactionsScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(path: '/budgets', builder: (c, s) => const BudgetsScreen()),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(path: '/stats', builder: (c, s) => const StatsScreen()),
          ],
        ),
      ],
    ),
    GoRoute(path: '/settings', builder: (c, s) => const SettingsScreen()),
  ],
);
