import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/database/db_providers.dart';
import '../../data/database/app_database.dart' show Account;

final accountsStreamProvider = StreamProvider<List<Account>>(
  (ref) => ref.watch(accountDaoProvider).watchAll(),
);
