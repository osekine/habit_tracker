import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
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
  final _days = ValueNotifier<List<IDayHabitViewModel>>([]);

  @override
  late final HabitColor baseColor;

  @override
  int get id => _habit.id;

  @override
  ValueListenable<List<IDayHabitViewModel>> get days => _days;

  @override
  String? get description => _habit.description;

  @override
  String get name => _habit.name;

  @override
  IDayHabitViewModel get today => days.value[0];

  YearHabitViewModel({
    required Habit habit,
    required IHabitsRepository habitsRepository,
  }) : _habitsRepository = habitsRepository,
       _habit = habit {
    baseColor =
    // TODO(NLU): change that cringe
    HabitColor.fromHabitColor(ColorCollection.habits[habit.colorName]!);
    _days.value =
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
        days.value
            .map(
              (dayVM) =>
                  DailyProgress(day: dayVM.day, progress: dayVM.count.value),
            )
            .toList();
    await _habitsRepository.saveHabits(_habit.copyWith(days: daysToSave));
  }

  @override
  String? get categoryName => _habit.category?.name;

  @override
  void updateDayProgress({required DateTime day}) {
    final neededDay = _days.value.firstWhere(
      (dayVM) => DateUtils.isSameDay(dayVM.day, day),
      orElse:
          () => DayHabitViewModel(
            day: day,
            habitColor: HabitColor.fromHabitColor(baseColor),
            save: saveChanges,
          ),
    )..add();

    if (_days.value.contains(neededDay)) return;

    _addNewDays(neededDay);
  }

  void _addNewDays(IDayHabitViewModel newDay) {
    final firstDay = _days.value.last.day;
    final daysCount = firstDay.difference(newDay.day);

    _days.value = [
      ..._days.value,
      for (int i = 1; i < daysCount.inDays; ++i)
        DayHabitViewModel(
          day: firstDay.subtract(Duration(days: i)),
          habitColor: HabitColor.fromHabitColor(baseColor),
          save: saveChanges,
        ),
      newDay,
    ];

    unawaited(saveChanges());
  }
}
