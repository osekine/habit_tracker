// ignore_for_file: avoid_catches_without_on_clauses, avoid_print

import 'dart:async';
import 'dart:convert';

import 'package:habit_tracker/data/i_habits_repository.dart';
import 'package:habit_tracker/domain/domain.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton(as: IHabitsRepository)
class HabitsRepository implements IHabitsRepository {
  final habitsKey = 'habits';
  final dateKey = 'date';
  final revisionKey = 'revision';
  
  late final SharedPreferences storage;
  int _revision = 0;
  Map<int, Habit> habits = {};

  @override
  int get revision => _revision;

  HabitsRepository();

  @PostConstruct(preResolve: true)
  Future<void> init() async {
    storage = await SharedPreferences.getInstance();
    _revision = storage.getInt(revisionKey) ?? 0;
    await loadHabits();
  }

  @override
  Future<List<Habit>> loadHabits() async {
    final data = storage.getStringList(habitsKey);
    print('${data?.length}');
    final habitsList =
        data
            ?.map<Habit>((string) => Habit.fromJson(jsonDecode(string)))
            .toList() ??
        [];
    if (habitsList.isEmpty) print('~~~EMPTY LIST~~~~');
    habits = {for (final habit in habitsList) habit.id: habit};
    await _checkDate();
    return habits.values.toList();
  }

  @override
  Future<void> saveHabits([Habit? newHabit]) async {
    if (newHabit != null) habits[newHabit.id] = newHabit;
    try {
      await storage.setStringList(
        habitsKey,
        habits.values.map((habit) => jsonEncode(habit.toJson())).toList(),
      );
      
      await storage.setInt(
        revisionKey,
        ++_revision,
      );
      print('~~~SUCCESS SAVE~~~');
    } catch (e) {
      print('ERROR:::$e');
    }
  }

  @override
  Future<void> archiveHabits() async {
    // TODO(NLU): now deleting, need archive
    await storage.setStringList(habitsKey, []);
  }

  Future<void> _checkDate() async {
    final savedDate = storage.getString(dateKey);
    if (savedDate == null) {
      await storage.setString(dateKey, DateTime.now().toIso8601String());
      return;
    }

    final today = DateTime.now();
    var lastDate = DateTime.parse(savedDate);

    while (today.day > lastDate.day ||
        today.month > lastDate.month ||
        today.year > lastDate.year) {
      lastDate = lastDate.add(const Duration(days: 1));
      habits = habits.map(
        (key, habit) => MapEntry(
          key,
          habit.copyWith(
            days: [DailyProgress(day: lastDate, progress: 0), ...habit.days],
          ),
        ),
      );
    }

    await storage.setString(dateKey, DateTime.now().toIso8601String());
    await saveHabits();
  }
}
