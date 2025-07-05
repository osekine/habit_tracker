import 'dart:ui';

import 'package:flutter/material.dart';

class HabitColor {
  final Color _light;
  final Color _standart;
  final Color _strong;
  Color get baseColor => _standart;
  Color get color => _calculateColor();
  double _progress = 1;

  HabitColor({
    required Color light,
    required Color standart,
    required Color strong,
  }) : _light = light,
       _standart = standart,
       _strong = strong;

  Color _calculateColor() {
    _progress = _progress.clamp(0, 2);
    return _progress <= 1
        ? Color.lerp(_light, _standart, _progress)!
        : Color.lerp(_standart, _strong, _progress - 1)!;
  }

  // ignore: use_setters_to_change_properties
  void lerpColor(double value) {
    _progress = value;
  }
}
