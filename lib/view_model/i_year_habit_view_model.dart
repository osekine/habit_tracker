import 'package:flutter/foundation.dart';
import 'package:habit_tracker/theme/habit_color.dart';
import 'package:habit_tracker/view_model/i_category_view_model.dart';

import 'i_day_habit_view_model.dart';

abstract interface class IYearHabitViewModel {
  int get id;
  String get name;
  String? get description;
  ICategoryViewModel? get category;
  ValueListenable<List<IDayHabitViewModel>> get days;
  IDayHabitViewModel get today;
  HabitColor get baseColor;
  Future<void> saveChanges();
  void updateDayProgress({required DateTime day});
}
