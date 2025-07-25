import 'package:flutter/foundation.dart' hide Category;
import 'package:habit_tracker/view_model/i_category_view_model.dart';

import '../domain/domain.dart';

class CategoryViewModel implements ICategoryViewModel {
  final Category _category;
  final _isChosen = ValueNotifier<bool>(false);

  CategoryViewModel({
    required Category category,
  }): _category = category;

  @override
  ValueListenable<bool> get isChosen => _isChosen;

  @override
  String get title => _category.name;
}
