import 'package:habit_tracker/domain/domain.dart';

abstract interface class IHabitsRepository {
  // CRUD
  Future<void> saveHabits(Habit newHabit);
  Future<List<Habit>> loadHabits();
  Future<void> archiveHabits();
  int get revision;
}
