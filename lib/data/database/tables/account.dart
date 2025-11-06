import 'package:drift/drift.dart';

enum AccountType { checking, saving, cash, paypal, other }

class Account extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get type =>
      text().map(const EnumNameConverter<AccountType>(AccountType.values))();
  TextColumn get currency => text().withDefault(const Constant('€'))();
  RealColumn get initialBalance =>
      real().named("initial_balance").withDefault(const Constant(0.0))();
  BoolColumn get isArchived =>
      boolean().named("is_archived").withDefault(const Constant(false))();
  TextColumn get colorHex =>
      text().named("color_hex").withDefault(const Constant('4280391411'))();
}
