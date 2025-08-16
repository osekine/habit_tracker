import 'dart:math';

import 'package:habit_tracker/data/i_habits_repository.dart';
import 'package:habit_tracker/domain/domain.dart';
import 'package:habit_tracker/view_model/i_edit_page_view_model.dart';
import 'package:habit_tracker/view_model/i_year_habit_view_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: IEditPageViewModel)
class EditPageViewModel implements IEditPageViewModel {
  final IHabitsRepository _repository;
  final IYearHabitViewModel? _habit;

  // TODO(NLU): add factory param for passing Habit
  EditPageViewModel({
    required IHabitsRepository repository,
    @factoryParam IYearHabitViewModel? editableHabit,
  }) : _repository = repository,
       _habit = editableHabit;

  @override
  Future<void> saveHabit(
    String name,
    String? description,
    String colorName,
  ) async {
    final newId = Random().nextInt(0xFFFFF);
    await _repository.saveHabits(
      Habit(
        id: _habit?.id ?? newId,
        name: name,
        description: description,
        colorName: colorName,
        days:
            _habit?.days
                .map(
                  (day) =>
                      DailyProgress(day: day.day, progress: day.count.value),
                )
                .toList() ??
            [DailyProgress(day: DateTime.now(), progress: 0)],
        isActive: true,
        categories: {const Category(name: 'defaultCategory', iconName: 'icon')},
      ),
    );
  }
}
