import 'package:flutter/foundation.dart' hide Category;
import 'package:habit_tracker/data/i_habits_repository.dart';
import 'package:habit_tracker/view_model/factories/i_year_habit_view_model_factory.dart';
import 'package:habit_tracker/view_model/i_category_view_model.dart';
import 'package:habit_tracker/view_model/i_year_habit_view_model.dart';

import '../domain/domain.dart';

class CategoryViewModel implements ICategoryViewModel {
  final Category _category;
  final IHabitsRepository _repository;
  final IYearHabitViewModelFactory _habitsFactory;

  final _isChosen = ValueNotifier<bool>(false);

  CategoryViewModel({
    required IHabitsRepository repository,
    required Category category,
    required IYearHabitViewModelFactory habitsFactory,
  }) : _category = category,
       _repository = repository,
       _habitsFactory = habitsFactory;

  @override
  ValueListenable<bool> get isChosen => _isChosen;

  @override
  String get title => _category.name;

  @override
  void switchChosen() {
    _isChosen.value = !_isChosen.value;
  }

  @override
  Future<List<IYearHabitViewModel>> fetchHabits() async {
    final allHabits = await _repository.loadHabits();
    final filteredHabits =
        allHabits
            .map((habit) {
              if (habit.category != null) return _habitsFactory.create(habit);
            })
            .nonNulls
            .toList();

    return filteredHabits;
  }

  @override
  String get iconName => _category.iconName;
}
