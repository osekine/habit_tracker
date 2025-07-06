import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:habit_tracker/theme/habit_color.dart';
import 'package:habit_tracker/view_model/i_day_habit_view_model.dart';

class DayHabitViewModel implements IDayHabitViewModel {
  final ValueNotifier<int> _count = ValueNotifier(0);
  final HabitColor _habitColor;

  @override
  int get count => _count.value;

  @override
  final DateTime day;

  @override
  final bool isStrict;

  @override
  final int? treshold;

  @override
  Color get color => _habitColor.color;

  DayHabitViewModel({
    required this.day,
    required HabitColor habitColor,
    this.isStrict = true,
    this.treshold,
  }) : _habitColor = habitColor {
    _init();
  }

  void _init() {
    _count.addListener(() {
      final progress = _count.value / (treshold ?? 1);
      _habitColor.lerpColor(progress);
    });
  }
}
