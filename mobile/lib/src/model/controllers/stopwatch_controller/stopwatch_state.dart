import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'stopwatch_state.freezed.dart';

@freezed
class StopwatchState with _$StopwatchState {
  factory StopwatchState({
    Stopwatch? stopwatch,
    Timer? timer,
    @Default(0) int elapsedMilliseconds,
  }) = _StopwatchState;

  StopwatchState._();
}
