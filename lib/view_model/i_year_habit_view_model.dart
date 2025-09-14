import 'package:habit_tracker/theme/habit_color.dart';

import 'i_day_habit_view_model.dart';

abstract interface class IYearHabitViewModel {
  int get id;
  String get name;
  String? get description;
  String? get categoryName;
  List<IDayHabitViewModel> get days;
  IDayHabitViewModel get today;
  HabitColor get baseColor;
  Future<void> saveChanges();
}
