import 'package:habit_tracker/data/i_habits_repository.dart';
import 'package:habit_tracker/domain/domain.dart';
import 'package:habit_tracker/domain/habit.dart';
import 'package:habit_tracker/view_model/factories/i_category_view_model_factory.dart';
import 'package:habit_tracker/view_model/factories/i_year_habit_view_model_factory.dart';
import 'package:habit_tracker/view_model/i_year_habit_view_model.dart';
import 'package:habit_tracker/view_model/year_habit_view_model.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IYearHabitViewModelFactory)
class YearHabitViewModelFactory implements IYearHabitViewModelFactory {
  final IHabitsRepository _habitsRepository;
  final ICategoryViewModelFactory _categoryFactory;

  const YearHabitViewModelFactory({
    required IHabitsRepository habitsRepository,
    required ICategoryViewModelFactory categoryFactory,
  }) : _habitsRepository = habitsRepository,
       _categoryFactory = categoryFactory;

  @override
  IYearHabitViewModel create(Habit habit) => YearHabitViewModel(
    habitsRepository: _habitsRepository,
    categoryFactory: _categoryFactory,
    habit: habit,
  );
}
