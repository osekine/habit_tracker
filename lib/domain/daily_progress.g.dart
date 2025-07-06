// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_progress.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DailyProgress _$DailyProgressFromJson(Map<String, dynamic> json) =>
    _DailyProgress(
      day: DateTime.parse(json['day'] as String),
      progress: (json['progress'] as num).toInt(),
    );

Map<String, dynamic> _$DailyProgressToJson(_DailyProgress instance) =>
    <String, dynamic>{
      'day': instance.day.toIso8601String(),
      'progress': instance.progress,
    };
