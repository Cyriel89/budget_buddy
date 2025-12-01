import 'package:budget_buddy/data/database/app_database.dart';
import 'package:budget_buddy/data/database/tables/recurring.dart';
import 'package:drift/drift.dart';

part 'recurring_dao.g.dart';

@DriftAccessor(tables: [Recurrings])
class RecurringDao extends DatabaseAccessor<AppDatabase>
    with _$RecurringDaoMixin {
  RecurringDao(super.db);

  Future<int> insertRecurring(RecurringsCompanion entry) =>
      into(recurrings).insert(entry);
  Future<int> updateRecurring(Recurring entry) =>
      (update(recurrings)..where((t) => t.id.equals(entry.id))).write(entry);
  Future<int> deleteById(int id) =>
      (delete(recurrings)..where((t) => t.id.equals(id))).go();
  Future<List<Recurring>> getAll() => select(recurrings).get();
  Stream<List<Recurring>> watchAll() => select(recurrings).watch();
  Future<List<Recurring>> getDueRecurrings(DateTime dateToCheck) =>
      (select(recurrings)..where(
            (r) =>
                r.nextDate.isSmallerOrEqualValue(dateToCheck) &
                (r.endDate.isNull() |
                    r.endDate.isBiggerOrEqualValue(dateToCheck)),
          ))
          .get();
}
