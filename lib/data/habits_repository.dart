// ignore_for_file: avoid_catches_without_on_clauses, avoid_print

import 'dart:async';
import 'dart:convert';

import 'package:habit_tracker/data/i_habits_repository.dart';
import 'package:habit_tracker/domain/habit.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton(as: IHabitsRepository)
class HabitsRepository implements IHabitsRepository {
  final habitsKey = 'habits';
  late final SharedPreferences storage;
  Map<int, Habit> habits = {};

  HabitsRepository();

  @PostConstruct(preResolve: true)
  Future<void> init() async {
    storage = await SharedPreferences.getInstance();
    loadHabits();
  }

  @override
  List<Habit> loadHabits() {
    final data = storage.getStringList(habitsKey);
    print('${data?.length}');
    final habitsList =
        data
            ?.map<Habit>((string) => Habit.fromJson(jsonDecode(string)))
            .toList() ??
        [];
    if (habitsList.isEmpty) print('~~~EMPTY LIST~~~~');
    habits = {for (final habit in habitsList) habit.id: habit};
    return habits.values.toList();
  }

  @override
  Future<void> saveHabits(Habit newHabit) async {
    habits[newHabit.id] = newHabit;
    try {
      await storage.setStringList(
        habitsKey,
        habits.values.map((habit) => jsonEncode(habit.toJson())).toList(),
      );
      print('~~~SUCCESS SAVE~~~');
    } catch (e) {
      print('ERROR:::$e');
    }
  }
}
