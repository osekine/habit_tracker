import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:habit_tracker/theme/habit_color.dart';

abstract final class HabitColors {
  static final red = HabitColor(
    light: const Color(0x80FFCCCC),
    standart: const Color(0xAAFF8888),
    strong: const Color(0xFFFF4444),
  );
  static final orange = HabitColor(
    light: const Color(0x80F4D79F),
    standart: const Color(0xAAD88A30),
    strong: const Color(0xFFB25900),
  );

  static final yellow = HabitColor(
    light: const Color(0x80FFF49F),
    standart: const Color(0xAAFFD700),
    strong: const Color(0xFFFFB200),
  );

  static final green = HabitColor(
    light: const Color(0x80D7F49F),
    standart: const Color(0xAA9ACD32),
    strong: const Color(0xFF76B041),
  );

  static final cyan = HabitColor(
    light: const Color(0x809FEAFF),
    standart: const Color(0xAA56BFFF),
    strong: const Color(0xFF00A1FF),
  );

  static final blue = HabitColor(
    light: const Color(0x80A5D8FF),
    standart: const Color(0xAA409EFF),
    strong: const Color(0xFF1E60FF),
  );

  static final purple = HabitColor(
    light: const Color(0x80FA9FFF),
    standart: const Color(0xAAC278FF),
    strong: const Color(0xFF8B3DAF),
  );

  static final pink = HabitColor(
    light: const Color(0x80FFA5F0),
    standart: const Color(0xAAFF40FF),
    strong: const Color(0xFFE01EFF),
  );

  static final gray = HabitColor(
    light: const Color(0x80ECECEC),
    standart: const Color(0xAABDBDBD),
    strong: const Color(0xFF7F7F7F),
  );

  static final white = HabitColor(
    light: const Color(0x80FFFFFF),
    standart: const Color(0xAAFFFFFF),
    strong: const Color(0xFFFFFFFF),
  );

  static final black = HabitColor(
    light: const Color(0x80333333),
    standart: const Color(0xAA222222),
    strong: const Color(0xFF000000),
  );

  static final lemonYellow = HabitColor(
    light: const Color(0x80FFF49F),
    standart: const Color(0xAAFFE066),
    strong: const Color(0xFFFFCC00),
  );

  static final mint = HabitColor(
    light: const Color(0x8098FB98),
    standart: const Color(0xAA76EE76),
    strong: const Color(0xFF52D052),
  );

  static final lavender = HabitColor(
    light: const Color(0x80FAE6FE),
    standart: const Color(0xAAD6BCFA),
    strong: const Color(0xFFB583EE),
  );

  static final peach = HabitColor(
    light: const Color(0x80FCDCDC),
    standart: const Color(0xAAFBB99A),
    strong: const Color(0xFFF98F61),
  );

  static final sand = HabitColor(
    light: const Color(0x80F5F5DC),
    standart: const Color(0xAAF0E68C),
    strong: const Color(0xFFE5D774),
  );

  static final darkGreen = HabitColor(
    light: const Color(0x808FBC8F),
    standart: const Color(0xAA669966),
    strong: const Color(0xFF4C764C),
  );

  static final turquoise = HabitColor(
    light: const Color(0x80A7FCE9),
    standart: const Color(0xAA74DDE8),
    strong: const Color(0xFF4ABDE8),
  );

  static final terracotta = HabitColor(
    light: const Color(0x80E4795C),
    standart: const Color(0xAAC65345),
    strong: const Color(0xFFA6372E),
  );

  static final fuchsia = HabitColor(
    light: const Color(0x80FFA7E9),
    standart: const Color(0xAAFF66CC),
    strong: const Color(0xFFE91E63),
  );

  static final lightGreen = HabitColor(
    light: const Color(0x80D0F0C0),
    standart: const Color(0xAA90D090),
    strong: const Color(0xFF54A054),
  );

  static final chocolate = HabitColor(
    light: const Color(0x806F4E37),
    standart: const Color(0xAA5D4037),
    strong: const Color(0xFF3E271E),
  );

  static final anthracite = HabitColor(
    light: const Color(0x804D4D4D),
    standart: const Color(0xAA333333),
    strong: const Color(0xFF262626),
  );

  static final ivory = HabitColor(
    light: const Color(0x80FDF5E6),
    standart: const Color(0xAAF5F0DC),
    strong: const Color(0xFFEBE5D9),
  );
}

abstract final class ColorCollection {
  static final monocrome = <String, HabitColor>{
    'black': HabitColors.black,
    'white': HabitColors.white,
    'gray': HabitColors.gray,
    'anthracite': HabitColors.anthracite,
  };

  static final habits = <String, HabitColor>{
    'blue': HabitColors.blue,
    'chocolate': HabitColors.chocolate,
    'cyan': HabitColors.cyan,
    'darkGreen': HabitColors.darkGreen,
    'fuchsia': HabitColors.fuchsia,
    'green': HabitColors.green,
    'ivory': HabitColors.ivory,
    'lavender': HabitColors.lavender,
    'lemonYellow': HabitColors.lemonYellow,
    'lightGreen': HabitColors.lightGreen,
    'mint': HabitColors.mint,
    'orange': HabitColors.orange,
    'peach': HabitColors.peach,
    'pink': HabitColors.pink,
    'purple': HabitColors.purple,
    'red': HabitColors.red,
    'sand': HabitColors.sand,
    'terracotta': HabitColors.terracotta,
    'turquoise': HabitColors.turquoise,
    'yellow': HabitColors.yellow,
  };
}
