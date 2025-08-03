import 'package:habit_tracker/domain/domain.dart';
import 'package:habit_tracker/view_model/i_category_view_model.dart';

abstract interface class ICategoryViewModelFactory {
  ICategoryViewModel create(Category category);
}
