import 'package:habit_tracker/theme/habit_color.dart';
import 'package:habit_tracker/view_model/i_day_habit_view_model.dart';
import 'package:habit_tracker/view_model/i_year_habit_view_model.dart';

class YearHabitViewModel implements IYearHabitViewModel {
  @override
  final HabitColor baseColor;

  @override
  final List<IDayHabitViewModel> days;

  @override
  final String? description;

  @override
  final String name;

  @override
  IDayHabitViewModel get today => days[0];

  const YearHabitViewModel({
    required this.baseColor,
    required this.days,
    required this.name,
    this.description,
  });
}
