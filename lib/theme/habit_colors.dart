import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:habit_tracker/theme/habit_color.dart';

abstract final class HabitColors {
  static final red = HabitColor(
    light: const Color(0xFFFFCCCC),
    standart: const Color(0xFFFF8888),
    strong: const Color(0xFFFF4444),
  );
  static final orange = HabitColor(
    light: const Color(0xFFF4D79F),
    standart: const Color(0xFFD88A30),
    strong: const Color(0xFFB25900),
  );

  static final yellow = HabitColor(
    light: const Color(0xFFFFF49F),
    standart: const Color(0xFFFFD700),
    strong: const Color(0xFFFFB200),
  );

  static final green = HabitColor(
    light: const Color(0xFFD7F49F),
    standart: const Color(0xFF9ACD32),
    strong: const Color(0xFF76B041),
  );

  static final cyan = HabitColor(
    light: const Color(0xFF9FEAFF),
    standart: const Color(0xFF56BFFF),
    strong: const Color(0xFF00A1FF),
  );

  static final blue = HabitColor(
    light: const Color(0xFFA5D8FF),
    standart: const Color(0xFF409EFF),
    strong: const Color(0xFF1E60FF),
  );

  static final purple = HabitColor(
    light: const Color(0xFFFA9FFF),
    standart: const Color(0xFFC278FF),
    strong: const Color(0xFF8B3DAF),
  );

  static final pink = HabitColor(
    light: const Color(0xFFFFA5F0),
    standart: const Color(0xFFFF40FF),
    strong: const Color(0xFFE01EFF),
  );

  static final gray = HabitColor(
    light: const Color(0xFFECECEC),
    standart: const Color(0xFFBDBDBD),
    strong: const Color(0xFF7F7F7F),
  );

  static final white = HabitColor(
    light: const Color(0xFFFFFFFF),
    standart: const Color(0xFFFFFFFF),
    strong: const Color(0xFFFFFFFF),
  );

  static final black = HabitColor(
    light: const Color(0xFF333333),
    standart: const Color(0xFF222222),
    strong: const Color(0xFF000000),
  );

  static final lemonYellow = HabitColor(
    light: const Color(0xFFFFF49F),
    standart: const Color(0xFFFFE066),
    strong: const Color(0xFFFFCC00),
  );

  static final mint = HabitColor(
    light: const Color(0xFF98FB98),
    standart: const Color(0xFF76EE76),
    strong: const Color(0xFF52D052),
  );

  static final lavender = HabitColor(
    light: const Color(0xFFFAE6FE),
    standart: const Color(0xFFD6BCFA),
    strong: const Color(0xFFB583EE),
  );

  static final peach = HabitColor(
    light: const Color(0xFFFCDCDC),
    standart: const Color(0xFFFBB99A),
    strong: const Color(0xFFF98F61),
  );

  static final sand = HabitColor(
    light: const Color(0xFFF5F5DC),
    standart: const Color(0xFFF0E68C),
    strong: const Color(0xFFE5D774),
  );

  static final darkGreen = HabitColor(
    light: const Color(0xFF8FBC8F),
    standart: const Color(0xFF669966),
    strong: const Color(0xFF4C764C),
  );

  static final turquoise = HabitColor(
    light: const Color(0xFFA7FCE9),
    standart: const Color(0xFF74DDE8),
    strong: const Color(0xFF4ABDE8),
  );

  static final terracotta = HabitColor(
    light: const Color(0xFFE4795C),
    standart: const Color(0xFFC65345),
    strong: const Color(0xFFA6372E),
  );

  static final fuchsia = HabitColor(
    light: const Color(0xFFFFA7E9),
    standart: const Color(0xFFFF66CC),
    strong: const Color(0xFFE91E63),
  );

  static final lightGreen = HabitColor(
    light: const Color(0xFFD0F0C0),
    standart: const Color(0xFF90D090),
    strong: const Color(0xFF54A054),
  );

  static final chocolate = HabitColor(
    light: const Color(0xFF6F4E37),
    standart: const Color(0xFF5D4037),
    strong: const Color(0xFF3E271E),
  );

  static final anthracite = HabitColor(
    light: const Color(0xFF4D4D4D),
    standart: const Color(0xFF333333),
    strong: const Color(0xFF262626),
  );

  static final ivory = HabitColor(
    light: const Color(0xFFFDF5E6),
    standart: const Color(0xFFF5F0DC),
    strong: const Color(0xFFEBE5D9),
  );
}

abstract final class ColorCollection {
  static final monocrome = [
    HabitColors.black,
    HabitColors.white,
    HabitColors.gray,
    HabitColors.anthracite,
  ];

  static final habits = [
    HabitColors.blue,
    HabitColors.chocolate,
    HabitColors.cyan,
    HabitColors.darkGreen,
    HabitColors.fuchsia,
    HabitColors.green,
    HabitColors.ivory,
    HabitColors.lavender,
    HabitColors.lemonYellow,
    HabitColors.lightGreen,
    HabitColors.mint,
    HabitColors.orange,
    HabitColors.peach,
    HabitColors.pink,
    HabitColors.purple,
    HabitColors.red,
    HabitColors.sand,
    HabitColors.terracotta,
    HabitColors.turquoise,
    HabitColors.yellow,
  ];
}
