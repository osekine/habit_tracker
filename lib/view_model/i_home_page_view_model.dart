import 'package:flutter/foundation.dart';
import 'package:habit_tracker/view_model/i_year_habit_view_model.dart';

abstract interface class IHomePageViewModel {
  Future<void> load();
  ValueListenable<List<IYearHabitViewModel>> get habits;
  Future<void> archiveHabits();
}
