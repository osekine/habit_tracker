import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:habit_tracker/theme/habit_color.dart';
import 'package:habit_tracker/view_model/i_day_habit_view_model.dart';

class DayHabitViewModel implements IDayHabitViewModel {
  final ValueNotifier<int> _count = ValueNotifier(0);
  final ValueNotifier<bool> _isDone = ValueNotifier(false);
  final HabitColor _habitColor;

  @override
  ValueListenable<int> get count => _count;

  @override
  final DateTime day;

  @override
  final bool isStrict;

  @override
  final int treshold;

  @override
  Color get color => _habitColor.color;

  @override
  ValueListenable<bool> get isDone => _isDone;

  @override
  void add([int value = 1]) {
    !_isDone.value ? _count.value += value : _count.value = 0;
  }

  DayHabitViewModel({
    required this.day,
    required HabitColor habitColor,
    int count = 0,
    bool isDone = false,
    this.isStrict = true,
    this.treshold = 1,
  }) : _habitColor = habitColor {
    _count.value = count;
    _isDone.value = isDone;
    _init();
  }

  void _init() {
    _count.addListener(() {
      final progress = _count.value / treshold;
      _isDone.value = _count.value >= treshold;
      _habitColor.lerpColor(progress);
    });
  }
}
