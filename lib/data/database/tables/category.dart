import 'package:drift/drift.dart';

enum CategoryType { income, expense, transfer }

class Category extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get type =>
      text().map(const EnumNameConverter<CategoryType>(CategoryType.values))();
  TextColumn get colorHex =>
      text().named("color_hex").withDefault(const Constant('4280391411'))();
  TextColumn get icon => text().nullable()();
}
