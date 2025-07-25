import 'package:flutter/foundation.dart';
import 'package:habit_tracker/data/i_habits_repository.dart';
import 'package:habit_tracker/view_model/factories/i_year_habit_view_model_factory.dart';
import 'package:habit_tracker/view_model/i_home_page_view_model.dart';
import 'package:habit_tracker/view_model/i_year_habit_view_model.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IHomePageViewModel)
class HomePageViewModel implements IHomePageViewModel {
  final IYearHabitViewModelFactory _habitViewModelFactory;
  final IHabitsRepository _repository;
  final _habits = ValueNotifier<List<IYearHabitViewModel>>([]);
  int _lastRevision = -1;

  @override
  ValueListenable<List<IYearHabitViewModel>> get habits => _habits;

  HomePageViewModel({
    required IHabitsRepository repository,
    required IYearHabitViewModelFactory habitViewModelFactory,
  }) : _repository = repository,
       _habitViewModelFactory = habitViewModelFactory;

  @PostConstruct(preResolve: true)
  Future<void> init() async {
    await load();
  }

  @override
  Future<void> load() async {
    if (_lastRevision < _repository.revision) {
      _lastRevision = _repository.revision;
      final loadedData = await _repository.loadHabits();
      _habits.value = loadedData.map(_habitViewModelFactory.create).toList();
    }
  }

  @override
  Future<void> archiveHabits() async {
    await _repository.archiveHabits();
    await load();
  }
}
