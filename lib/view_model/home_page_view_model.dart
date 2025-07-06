import 'package:habit_tracker/data/i_habits_repository.dart';
import 'package:habit_tracker/view_model/factories/i_year_habit_view_model_factory.dart';
import 'package:habit_tracker/view_model/i_home_page_view_model.dart';
import 'package:habit_tracker/view_model/i_year_habit_view_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: IHomePageViewModel)
class HomePageViewModel implements IHomePageViewModel {
  final IYearHabitViewModelFactory _habitViewModelFactory;
  final IHabitsRepository _repository;
  List<IYearHabitViewModel> _habits = [];

  @override
  List<IYearHabitViewModel> get habits => _habits;

  HomePageViewModel({
    required IHabitsRepository repository,
    required IYearHabitViewModelFactory habitViewModelFactory,
  }) : _repository = repository,
       _habitViewModelFactory = habitViewModelFactory;

  @postConstruct
  void init() {
    load();
  }

  @override
  void load() {
    final loadedData = _repository.loadHabits();
    _habits =
        loadedData
            .map(_habitViewModelFactory.create)
            .toList();
  }

  @override
  Future<void> archiveHabits() async{
    await _repository.archiveHabits();
    load();
  }
}
