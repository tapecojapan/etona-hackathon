import 'dart:async';
import 'dart:core';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'stopwatch_state.dart';
export 'stopwatch_state.dart';

final stopwatchProvider = StateNotifierProvider.family
    .autoDispose<StopwatchController, StopwatchState, int>(
        StopwatchController.new);

class StopwatchController extends StateNotifier<StopwatchState> {
  StopwatchController(this._ref, this._seconds) : super(StopwatchState()) {
    () async {
      final stopwatch = Stopwatch();
      state = state.copyWith(stopwatch: stopwatch);
      start();
      setTimer();
    }();
  }

  final AutoDisposeStateNotifierProviderRef<StopwatchController, StopwatchState>
      _ref;
  final int _seconds;

  @override
  void dispose() {
    cancelTimer();
    super.dispose();
  }

  void cancelTimer() {
    if (mounted) {
      if (state.timer != null) {
        state.timer!.cancel();
      }
    }
  }

  void setTimer() {
    final timer = Timer.periodic(
      const Duration(milliseconds: 100),
      (Timer timer) async {
        final elapsedMilliseconds = state.stopwatch?.elapsedMilliseconds ?? 0;
        state = state.copyWith(elapsedMilliseconds: elapsedMilliseconds);
        if (elapsedMilliseconds > _seconds) {
          cancelTimer();
        }
      },
    );
    state = state.copyWith(
      timer: timer,
    );
  }

  void start() {
    final stopwatch = state.stopwatch;
    if (stopwatch == null) {
      return;
    }
    stopwatch.start();
  }

  void stop() {
    final stopwatch = state.stopwatch;
    if (stopwatch == null) {
      return;
    }
    stopwatch.stop();
  }
}
