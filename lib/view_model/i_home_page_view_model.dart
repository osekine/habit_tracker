import 'package:habit_tracker/view_model/i_year_habit_view_model.dart';

abstract interface class IHomePageViewModel {
  void load();
  List<IYearHabitViewModel> get habits;
}
