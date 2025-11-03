import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/theme/app_theme.dart';
import 'presentation/routes/app_router.dart';
import 'core/theme/theme_mode_provider.dart'; // <-- importe le provider partagé

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: BudgetBuddyApp()));
}

class BudgetBuddyApp extends ConsumerWidget {
  const BudgetBuddyApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mode = ref.watch(themeModeProvider);
    return MaterialApp.router(
      title: 'Budget Buddy',
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: mode,
      routerConfig: appRouter,
    );
  }
}
