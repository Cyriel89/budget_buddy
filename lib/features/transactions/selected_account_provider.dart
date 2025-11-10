import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectedAccountNotifier extends Notifier<int?> {
  @override
  int? build() => null; // null = "Tous les comptes"
  void set(int? id) => state = id;
  void clear() => state = null;
}

final selectedAccountIdProvider =
    NotifierProvider<SelectedAccountNotifier, int?>(
      SelectedAccountNotifier.new,
    );
