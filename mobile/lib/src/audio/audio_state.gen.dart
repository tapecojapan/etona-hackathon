import 'dart:collection';
import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'songs.dart';

part 'audio_state.gen.freezed.dart';

@freezed
class AudioState with _$AudioState {
  factory AudioState({
    @Default(2) int polyphony,
    AudioPlayer? musicPlayer,
    @Default(<AudioPlayer>[]) List<AudioPlayer> sfxPlayers,
    @Default(0) int currentSfxPlayer,
    Queue<Song>? playlist,
    Random? random,
    void Function()? disposeListener,
  }) = _AudioState;
}
