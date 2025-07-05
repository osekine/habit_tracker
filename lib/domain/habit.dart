// ignore_for_file: annotate_overrides

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:habit_tracker/domain/daily_progress.dart';

part 'habit.freezed.dart';

@freezed
class Habit with _$Habit {
  final int id;
  final String name;
  final String? description;
  final String colorName;
  final List<DailyProgress> days;
  final bool isActive;

  const Habit({
    required this.id,
    required this.name,
    required this.description,
    required this.colorName,
    required this.days,
    required this.isActive,
  });
}
