import 'package:flutter/foundation.dart';
import 'package:habit_tracker/data/i_habits_repository.dart';
import 'package:habit_tracker/view_model/factories/i_category_view_model_factory.dart';
import 'package:habit_tracker/view_model/factories/i_year_habit_view_model_factory.dart';
import 'package:habit_tracker/view_model/i_category_view_model.dart';
import 'package:habit_tracker/view_model/i_home_page_view_model.dart';
import 'package:habit_tracker/view_model/i_year_habit_view_model.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IHomePageViewModel)
class HomePageViewModel implements IHomePageViewModel {
  final IYearHabitViewModelFactory _habitViewModelFactory;
  final IHabitsRepository _repository;
  final _habits = ValueNotifier<List<IYearHabitViewModel>>([]);
  final ICategoryViewModelFactory _categoriesFactory;
  Set<ICategoryViewModel> _activeCategories = {};
  List<IYearHabitViewModel> _allHabits = [];
  ICategoryViewModel? _chosenCategory;

  @override
  ValueListenable<List<IYearHabitViewModel>> get habits => _habits;

  HomePageViewModel({
    required ICategoryViewModelFactory categoriesFactory,
    required IHabitsRepository repository,
    required IYearHabitViewModelFactory habitViewModelFactory,
  }) : _repository = repository,
       _habitViewModelFactory = habitViewModelFactory,
       _categoriesFactory = categoriesFactory;

  @preResolve
  Future<void> init() async {
    await load();
  }

  @override
  Future<void> load() async {
    await _loadHabits();
    _loadCategories();
  }

  Future<void> _loadHabits() async {
    final loadedData = await _repository.loadHabits();
    _allHabits = loadedData.map(_habitViewModelFactory.create).toList();
    filterHabits();
  }

  void _loadCategories() {
    final newActiveCategories =
        _repository.activeCategories.map(_categoriesFactory.create).toSet();

    for (final category in newActiveCategories.difference(_activeCategories)) {
      category.isChosen.addListener(
        () async =>
            category.isChosen.value
                ? _habits.value = _filterHabits(category)
                : await _loadHabits(),
      );
    }

    _activeCategories = newActiveCategories;
  }

  List<IYearHabitViewModel> _filterHabits(ICategoryViewModel targetCategory) {
    final filteredHabits =
        _allHabits.where((habit) => habit.category == targetCategory).toList();

    return filteredHabits;
  }

  @override
  Future<void> archiveHabits() async {
    await _repository.archiveHabits();
    await load();
  }

  @override
  List<ICategoryViewModel> get activeCategories => _activeCategories.toList();

  @override
  void filterHabits([ICategoryViewModel? category]) {
    _chosenCategory = category;
    _habits.value =
        category == null
            ? _allHabits
            : _allHabits
                .where((habit) => habit.category?.title == category.title)
                .toList();
  }

  @override
  ICategoryViewModel? get chosenCategory => _chosenCategory;
}
