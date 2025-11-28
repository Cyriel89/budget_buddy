import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class SelectedMonthNotifier extends Notifier<String> {
  @override
  String build() {
    return DateFormat('yyyy-MM').format(DateTime.now());
  }

  void setMonth(String yearMonth) {
    state = yearMonth;
  }

  void goToPreviousMonth() {
    final current = DateTime.parse('${state}-01');
    final previous = DateTime(current.year, current.month - 1, 1);
    state = DateFormat('yyyy-MM').format(previous);
  }

  void goToNextMonth() {
    final current = DateTime.parse('${state}-01');
    final next = DateTime(current.year, current.month + 1, 1);
    state = DateFormat('yyyy-MM').format(next);
  }
}

final selectedMonthProvider = NotifierProvider<SelectedMonthNotifier, String>(
  SelectedMonthNotifier.new,
);
