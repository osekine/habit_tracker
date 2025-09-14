import 'dart:math';

import 'package:habit_tracker/data/i_habits_repository.dart';
import 'package:habit_tracker/domain/domain.dart';
import 'package:habit_tracker/view_model/category_view_model.dart';
import 'package:habit_tracker/view_model/factories/i_category_view_model_factory.dart';
import 'package:habit_tracker/view_model/i_category_view_model.dart';
import 'package:habit_tracker/view_model/i_edit_page_view_model.dart';
import 'package:habit_tracker/view_model/i_year_habit_view_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: IEditPageViewModel)
class EditPageViewModel implements IEditPageViewModel {
  final IHabitsRepository _repository;
  final IYearHabitViewModel? _habit;
  final ICategoryViewModelFactory _categoriesFactory;

  EditPageViewModel({
    required IHabitsRepository repository,
    required ICategoryViewModelFactory categoriesFactory,
    @factoryParam IYearHabitViewModel? editableHabit,
  }) : _repository = repository,
       _categoriesFactory = categoriesFactory,
       _habit = editableHabit;

  @override
  Future<void> saveHabit(
    String name,
    String? description,
    String colorName,
  ) async {
    final newId = Random().nextInt(0xFFFFF);
    await _repository.saveHabits(
      Habit(
        id: _habit?.id ?? newId,
        name: name,
        description: description,
        colorName: colorName,
        days:
            _habit?.days
                .map(
                  (day) =>
                      DailyProgress(day: day.day, progress: day.count.value),
                )
                .toList() ??
            [DailyProgress(day: DateTime.now(), progress: 0)],
        isActive: true,
        categories: {const Category(name: 'defaultCategory', iconName: 'icon')},
      ),
    );
  }

  @override
  List<ICategoryViewModel> get categories => [
    _categoriesFactory.create(
      const Category(name: 'defaultCategory', iconName: 'icon'),
    ),
    _categoriesFactory.create(
      const Category(name: 'dasdasdasdadasdsadasdCategory', iconName: 'icon'),
    ),
    _categoriesFactory.create(
      const Category(name: 'category', iconName: 'icon'),
    ),
    _categoriesFactory.create(
      const Category(name: 'efaultCategory', iconName: 'icon'),
    ),
  ];
}
