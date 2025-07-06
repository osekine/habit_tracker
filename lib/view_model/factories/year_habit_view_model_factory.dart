import 'package:habit_tracker/data/i_habits_repository.dart';
import 'package:habit_tracker/domain/domain.dart';
import 'package:habit_tracker/domain/habit.dart';
import 'package:habit_tracker/view_model/factories/i_year_habit_view_model_factory.dart';
import 'package:habit_tracker/view_model/i_year_habit_view_model.dart';
import 'package:habit_tracker/view_model/year_habit_view_model.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IYearHabitViewModelFactory)
class YearHabitViewModelFactory implements IYearHabitViewModelFactory {
  final IHabitsRepository _habitsRepository;

  const YearHabitViewModelFactory({required IHabitsRepository habitsRepository})
    : _habitsRepository = habitsRepository;

  @override
  IYearHabitViewModel create(Habit habit) => YearHabitViewModel(
      habitsRepository: _habitsRepository,
      habit: habit,
    );
}
