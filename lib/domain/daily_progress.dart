import 'package:freezed_annotation/freezed_annotation.dart';

part 'daily_progress.freezed.dart';
part 'daily_progress.g.dart';

@freezed
abstract class DailyProgress with _$DailyProgress {
  const factory DailyProgress({required DateTime day, required int progress}) =
      _DailyProgress;

  factory DailyProgress.fromJson(Map<String, dynamic> json) =>
      _$DailyProgressFromJson(json);
}
