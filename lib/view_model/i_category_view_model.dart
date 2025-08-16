import 'package:flutter/foundation.dart';
import 'package:habit_tracker/view_model/view_model.dart';

abstract interface class ICategoryViewModel {
  String get title;
  // TODO(NLU): add icon
  ValueListenable<bool> get isChosen;
  void switchChosen();
  Future<List<IYearHabitViewModel>> fetchHabits();
}
