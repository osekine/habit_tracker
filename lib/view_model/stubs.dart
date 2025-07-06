// TODO(NLU): delete this file in prod
import 'package:habit_tracker/theme/habit_colors.dart';
import 'package:habit_tracker/view_model/day_habit_view_model.dart';
import 'package:habit_tracker/view_model/year_habit_view_model.dart';

final stubDay = DayHabitViewModel(
  day: DateTime.now(),
  habitColor: ColorCollection.habits['blue']!,
);
final stubYear = YearHabitViewModel(
  baseColor: ColorCollection.habits['blue']!,
  days: [stubDay],
  name: 'Habit name',
  description: 'Habit description',
);
