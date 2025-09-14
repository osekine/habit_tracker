import 'package:habit_tracker/view_model/i_category_view_model.dart';

abstract interface class IEditPageViewModel {
  void saveHabit(String name, String? description, String colorName);
  List<ICategoryViewModel> get categories;
}
