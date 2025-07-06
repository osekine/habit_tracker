import 'dart:ui';

import 'package:flutter/material.dart';

class HabitColor {
  final Color _light;
  final Color _standart;
  final Color _strong;
  Color get baseColor => _standart;
  Color get color => _calculateColor();
  Color get inactiveColor => _light.withAlpha(40);
  double _progress = 1;

  HabitColor({
    required Color light,
    required Color standart,
    required Color strong,
    double progress = 1,
  }) : _light = light,
       _standart = standart,
       _strong = strong,
       _progress = progress;

  Color _calculateColor() {
    _progress = _progress.clamp(0, 1) * 2;
    return _progress <= 1
        ? Color.lerp(_light, _standart, _progress)!
        : Color.lerp(_standart, _strong, _progress - 1)!;
  }

  // ignore: use_setters_to_change_properties
  void lerpColor(double value) {
    _progress = value;
  }

  factory HabitColor.fromHabitColor(HabitColor other) => HabitColor(
    light: other._light,
    standart: other._standart,
    strong: other._strong,
    progress: other._progress,
  );
}
