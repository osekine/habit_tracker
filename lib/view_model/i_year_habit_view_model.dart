import 'package:habit_tracker/theme/habit_color.dart';

import 'i_day_habit_view_model.dart';

abstract interface class IYearHabitViewModel {
  String get name;
  String? get description;
  List<IDayHabitViewModel> get days;
  IDayHabitViewModel get today;
  HabitColor get baseColor;
}
