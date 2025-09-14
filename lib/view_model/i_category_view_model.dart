import 'package:flutter/foundation.dart';
import 'package:habit_tracker/view_model/view_model.dart';

abstract interface class ICategoryViewModel {
  String get title;
  String get iconName;
  ValueListenable<bool> get isChosen;
  void switchChosen();
  Future<List<IYearHabitViewModel>> fetchHabits();
}
