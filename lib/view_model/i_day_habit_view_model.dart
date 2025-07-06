import 'dart:ui';

import 'package:flutter/foundation.dart';

abstract interface class IDayHabitViewModel {
  DateTime get day;
  ValueListenable<int> get count;
  int get treshold;
  bool get isStrict;
  Color get color;
  ValueListenable<bool> get isDone;
  void add([int value]);
}
