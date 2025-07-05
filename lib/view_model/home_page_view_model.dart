import 'package:habit_tracker/data/i_habits_repository.dart';
import 'package:habit_tracker/theme/habit_colors.dart';
import 'package:habit_tracker/view_model/i_home_page_view_model.dart';
import 'package:habit_tracker/view_model/i_year_habit_view_model.dart';
import 'package:habit_tracker/view_model/year_habit_view_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: IHomePageViewModel)
class HomePageViewModel implements IHomePageViewModel {
  final IHabitsRepository _repository;
  List<IYearHabitViewModel> _habits = [];

  @override
  List<IYearHabitViewModel> get habits => _habits;

  HomePageViewModel({required IHabitsRepository repository})
    : _repository = repository;

  @override
  void init() {
    _load();
  }

  void _load() {
    final loadedData = _repository.loadHabits();
    _habits =
        loadedData
            .map(
              (habit) => YearHabitViewModel(
                baseColor: ColorCollection.habits[habit.colorName]!.baseColor,
                days: [],
                name: habit.name,
                description: habit.description,
              ),
            )
            .toList();
  }
}
