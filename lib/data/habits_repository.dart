import 'package:habit_tracker/data/i_habits_repository.dart';
import 'package:habit_tracker/domain/habit.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Injectable(as: IHabitsRepository)
class HabitsRepository implements IHabitsRepository {
  // TODO(NLU): change to save/load with storage
  Map<int, Habit> habits = {};

  HabitsRepository();

  @override
  List<Habit> loadHabits() => habits.values.toList();

  @override
  void saveHabits(Habit newHabit) {
    habits[newHabit.id] = newHabit;
  }
}
