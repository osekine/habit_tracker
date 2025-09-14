import 'package:habit_tracker/data/i_habits_repository.dart';
import 'package:habit_tracker/domain/domain.dart';
import 'package:habit_tracker/theme/habit_color.dart';
import 'package:habit_tracker/theme/habit_colors.dart';
import 'package:habit_tracker/view_model/day_habit_view_model.dart';
import 'package:habit_tracker/view_model/i_day_habit_view_model.dart';
import 'package:habit_tracker/view_model/i_year_habit_view_model.dart';

class YearHabitViewModel implements IYearHabitViewModel {
  final IHabitsRepository _habitsRepository;
  final Habit _habit;

  @override
  late final HabitColor baseColor;

  @override
  int get id => _habit.id;

  @override
  late final List<IDayHabitViewModel> days;

  @override
  String? get description => _habit.description;

  @override
  String get name => _habit.name;

  @override
  IDayHabitViewModel get today => days[0];

  YearHabitViewModel({
    required Habit habit,
    required IHabitsRepository habitsRepository,
  }) : _habitsRepository = habitsRepository,
       _habit = habit {
    baseColor =
    // TODO(NLU): change that cringe
    HabitColor.fromHabitColor(ColorCollection.habits[habit.colorName]!);
    days =
        habit.days
            .map(
              (dailyProgress) => DayHabitViewModel(
                day: dailyProgress.day,
                habitColor: HabitColor.fromHabitColor(baseColor),
                count: dailyProgress.progress,
                save: saveChanges,
              ),
            )
            .toList();
  }

  @override
  Future<void> saveChanges() async {
    final daysToSave =
        days
            .map(
              (dayVM) =>
                  DailyProgress(day: dayVM.day, progress: dayVM.count.value),
            )
            .toList();
    await _habitsRepository.saveHabits(_habit.copyWith(days: daysToSave));
  }
  
  @override
  String? get categoryName => _habit.category?.name;
}
