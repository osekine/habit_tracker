import 'package:flutter/foundation.dart';
import 'package:habit_tracker/view_model/i_day_habit_view_model.dart';

class DayHabitViewModel implements IDayHabitViewModel{
  final ValueNotifier<int> _count = ValueNotifier(0);

  @override
  int get count => _count.value;

  @override
  final DateTime day;

  @override
  final bool isStrict;

  @override
  final int? treshold;

  DayHabitViewModel({
    required this.day,
    this.isStrict = true,
    this.treshold,
  });
}
