import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/theme_mode_provider.dart';

class StatsScreen extends ConsumerWidget {
  const StatsScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mode = ref.watch(themeModeProvider); // ThemeMode courant
    return Scaffold(
      appBar: AppBar(
        title: const Text('Statistiques'),
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
      body: const Center(child: Text('Stats')),
    );
  }
}
