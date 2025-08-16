import 'package:habit_tracker/data/i_habits_repository.dart';
import 'package:habit_tracker/domain/domain.dart';
import 'package:habit_tracker/view_model/category_view_model.dart';
import 'package:habit_tracker/view_model/factories/i_category_view_model_factory.dart';
import 'package:habit_tracker/view_model/factories/i_year_habit_view_model_factory.dart';
import 'package:habit_tracker/view_model/i_category_view_model.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ICategoryViewModelFactory)
class CategoryViewModelFactory implements ICategoryViewModelFactory {
  final IHabitsRepository _repository;
  final IYearHabitViewModelFactory _habitsFactory;

  const CategoryViewModelFactory({
    required IHabitsRepository repository,
    required IYearHabitViewModelFactory habitsFactory,
  }) : _repository = repository,
       _habitsFactory = habitsFactory;

  @override
  ICategoryViewModel create(Category category) => CategoryViewModel(
    repository: _repository,
    category: category,
    habitsFactory: _habitsFactory,
  );
}
