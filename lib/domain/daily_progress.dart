import 'package:freezed_annotation/freezed_annotation.dart';

part 'daily_progress.freezed.dart';

@freezed
abstract class DailyProgress with _$DailyProgress {
  const factory DailyProgress({
    required DateTime day,
    required int progress,
  })=_DailyProgress;
}
