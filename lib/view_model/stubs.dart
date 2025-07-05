// TODO(NLU): delete this file in prod

import 'package:flutter/material.dart';
import 'package:habit_tracker/view_model/day_habit_view_model.dart';
import 'package:habit_tracker/view_model/year_habit_view_model.dart';

final stubDay = DayHabitViewModel(day: DateTime.now());
final stubYear = YearHabitViewModel(
  baseColor: Colors.amberAccent,
  days: [stubDay],
  name: 'Habit name',
  description: 'Habit description',
);
