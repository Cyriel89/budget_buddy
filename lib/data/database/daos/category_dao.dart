import 'package:budget_buddy/data/database/app_database.dart';
import 'package:budget_buddy/data/database/tables/category.dart';
import 'package:drift/drift.dart';

part 'category_dao.g.dart';

@DriftAccessor(tables: [Category])
class CategoryDao extends DatabaseAccessor<AppDatabase>
    with _$CategoryDaoMixin {
  CategoryDao(super.db);

  Future<int> insertCategory(CategoryCompanion entry) =>
      into(category).insert(entry);
  Future<List<CategoryData>> getAll() => select(category).get();
  Stream<List<CategoryData>> watchAll() => select(category).watch();
  Future<int> deleteById(int id) =>
      (delete(category)..where((t) => t.id.equals(id))).go();
}
