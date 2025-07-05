import 'dart:math';

import 'package:habit_tracker/data/i_habits_repository.dart';
import 'package:habit_tracker/domain/habit.dart';
import 'package:habit_tracker/view_model/i_edit_page_view_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: IEditPageViewModel)
class EditPageViewModel implements IEditPageViewModel {
  final IHabitsRepository _repository;

  EditPageViewModel({required IHabitsRepository repository})
    : _repository = repository;

  @override
  void saveHabit(String name, String? description, String colorName) {
    final newId = Random().nextInt(0xFFFFFFFFF);
    _repository.saveHabits(
      Habit(
        id: newId,
        name: name,
        description: description,
        colorName: colorName,
        days: [],
        isActive: true,
      ),
    );
  }
}
