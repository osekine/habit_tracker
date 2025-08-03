import 'package:habit_tracker/domain/domain.dart';
import 'package:habit_tracker/view_model/category_view_model.dart';
import 'package:habit_tracker/view_model/factories/i_category_view_model_factory.dart';
import 'package:habit_tracker/view_model/i_category_view_model.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ICategoryViewModelFactory)
class CategoryViewModelFactory implements ICategoryViewModelFactory {
  @override
  ICategoryViewModel create(Category category) =>
      CategoryViewModel(category: category);
}
