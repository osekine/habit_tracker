import 'package:habit_tracker/domain/domain.dart';

abstract interface class IHabitsRepository {
  // CRUD
  void saveHabits(Habit newHabit);
  List<Habit> loadHabits();
}
