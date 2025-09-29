import 'package:flutter/foundation.dart';
import 'package:habit_tracker/view_model/i_category_view_model.dart';
import 'package:habit_tracker/view_model/i_year_habit_view_model.dart';


abstract interface class IEditPageViewModel {
  Future<void> saveHabit(String name, String? description, String colorName);
  
  List<ICategoryViewModel> get categories;
  ValueListenable<ICategoryViewModel?> get chosenCategory;
  void chooseCategory(ICategoryViewModel? category);
  IYearHabitViewModel? get habit;
}
