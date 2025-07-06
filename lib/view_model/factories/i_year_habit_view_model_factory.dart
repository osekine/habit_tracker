import 'package:habit_tracker/domain/habit.dart';
import 'package:habit_tracker/view_model/view_model.dart';

abstract interface class IYearHabitViewModelFactory {
  IYearHabitViewModel create(Habit habit);
}
