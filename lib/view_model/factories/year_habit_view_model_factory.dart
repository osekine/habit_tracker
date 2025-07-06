import 'package:habit_tracker/domain/domain.dart';
import 'package:habit_tracker/domain/habit.dart';
import 'package:habit_tracker/theme/habit_colors.dart';
import 'package:habit_tracker/view_model/day_habit_view_model.dart';
import 'package:habit_tracker/view_model/factories/i_year_habit_view_model_factory.dart';
import 'package:habit_tracker/view_model/i_year_habit_view_model.dart';
import 'package:habit_tracker/view_model/year_habit_view_model.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IYearHabitViewModelFactory)
class YearHabitViewModelFactory implements IYearHabitViewModelFactory {
  @override
  IYearHabitViewModel create(Habit habit) {
    final baseColor = ColorCollection.habits[habit.colorName]!;
    return YearHabitViewModel(
      baseColor: baseColor,
      days:
          habit.days
              .map(
                (dailyProgress) => DayHabitViewModel(
                  day: dailyProgress.day,
                  habitColor: baseColor,
                  count: dailyProgress.progress,
                ),
              )
              .toList(),
      name: habit.name,
      description: habit.description,
    );
  }
}
