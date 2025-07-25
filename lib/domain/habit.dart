// ignore_for_file: annotate_overrides

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:habit_tracker/domain/daily_progress.dart';

import 'category.dart';

part 'habit.freezed.dart';
part 'habit.g.dart';

@freezed
abstract class Habit with _$Habit {
  const factory Habit({
    required int id,
    required String name,
    required String? description,
    required String colorName,
    required List<DailyProgress> days,
    required bool isActive,
    Set<Category>? categories,
  }) = _Habit;

  factory Habit.fromJson(Map<String, dynamic> json) => _$HabitFromJson(json);
}
