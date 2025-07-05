import 'package:habit_tracker/view_model/i_year_habit_view_model.dart';

abstract interface class IHomePageViewModel {
  void init();
  List<IYearHabitViewModel> get habits;
}
