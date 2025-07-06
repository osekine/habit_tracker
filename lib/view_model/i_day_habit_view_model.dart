import 'dart:ui';

abstract interface class IDayHabitViewModel {
  DateTime get day;
  int get count;
  int? get treshold;
  bool get isStrict;
  Color get color;
}
