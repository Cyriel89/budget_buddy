import 'package:budget_buddy/data/database/app_database.dart';
import 'package:budget_buddy/data/database/tables/category.dart';
import 'package:drift/drift.dart';

part 'category_dao.g.dart';

@DriftAccessor(tables: [Categories])
class CategoryDao extends DatabaseAccessor<AppDatabase>
    with _$CategoryDaoMixin {
  CategoryDao(super.db);

  Future<int> insertCategory(CategoriesCompanion entry) =>
      into(categories).insert(entry);
  Future<List<Category>> getAll() => select(categories).get();
  Stream<List<Category>> watchAll() => select(categories).watch();
  Future<int> deleteById(int id) =>
      (delete(categories)..where((t) => t.id.equals(id))).go();
}
