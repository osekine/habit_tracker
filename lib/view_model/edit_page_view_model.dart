import 'dart:async';
import 'dart:math';

import 'package:flutter/foundation.dart' hide Category;
import 'package:habit_tracker/data/i_habits_repository.dart';
import 'package:habit_tracker/domain/domain.dart';
import 'package:habit_tracker/view_model/factories/i_category_view_model_factory.dart';
import 'package:habit_tracker/view_model/i_category_view_model.dart';
import 'package:habit_tracker/view_model/i_edit_page_view_model.dart';
import 'package:habit_tracker/view_model/i_year_habit_view_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: IEditPageViewModel)
class EditPageViewModel implements IEditPageViewModel {
  final IHabitsRepository _repository;
  final ICategoryViewModelFactory _categoriesFactory;

  final _chosenCategory = ValueNotifier<ICategoryViewModel?>(null);
  late final List<ICategoryViewModel> _categoriesList;

  EditPageViewModel({
    required IHabitsRepository repository,
    required ICategoryViewModelFactory categoriesFactory,
    @factoryParam IYearHabitViewModel? editableHabit,
  }) : _repository = repository,
       _categoriesFactory = categoriesFactory,
       habit = editableHabit;

  @postConstruct
  void init() {
    _chosenCategory.value = habit?.category;
    unawaited(_loadCategories());
  }

  @override
  final IYearHabitViewModel? habit;

  @override
  Future<void> saveHabit(
    String name,
    String? description,
    String colorName,
  ) async {
    final newId = Random().nextInt(0xFFFFF);
    final category = _chosenCategory.value;

    await _repository.saveHabits(
      Habit(
        id: habit?.id ?? newId,
        name: name,
        description: description,
        colorName: colorName,
        days:
            habit?.days.value
                .map(
                  (day) =>
                      DailyProgress(day: day.day, progress: day.count.value),
                )
                .toList() ??
            [DailyProgress(day: DateTime.now(), progress: 0)],
        isActive: true,
        category:
            category != null
                ? Category(name: category.title, iconName: category.iconName)
                : null,
      ),
    );
  }

  @override
  List<ICategoryViewModel> get categories => _categoriesList;

  @override
  ValueListenable<ICategoryViewModel?> get chosenCategory => _chosenCategory;

  @override
  void chooseCategory(ICategoryViewModel? category) {
    _chosenCategory.value = category;
  }

  Future<void> _loadCategories() async {
    final categoriesSet = await _repository.loadCategories();
    _categoriesList = categoriesSet.map(_categoriesFactory.create).toList();
  }
}
