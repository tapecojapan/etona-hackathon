// Copyright 2022, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:collection';
import 'dart:math';

import 'package:audioplayers/audioplayers.dart';

import 'package:etona/src/model/model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logging/logging.dart';

import 'audio_state.gen.dart';
import 'songs.dart';
import 'sounds.dart';

class AudioController extends StateNotifier<AudioState> {
  AudioController(this._ref) : super(AudioState()) {
    () async {
      final musicPlayer = AudioPlayer(playerId: 'musicPlayer');
      state = state.copyWith(
        musicPlayer: musicPlayer,
        sfxPlayers: Iterable.generate(
                state.polyphony, (i) => AudioPlayer(playerId: 'sfxPlayer#$i'))
            .toList(growable: false),
        playlist: Queue.of(List<Song>.of(songs)..shuffle()),
        random: Random(),
      );
      musicPlayer.onPlayerComplete.listen(_changeSong);
      await initialize();
    }();
  }

  static final _log = Logger('AudioController');
  final StateNotifierProviderRef<AudioController, AudioState> _ref;

  /// Enables the [AudioController] to track changes to settings.
  /// Namely, when any of [SettingsController.muted],
  /// [SettingsController.musicOn] or [SettingsController.soundsOn] changes,
  /// the audio controller will act accordingly.

  Future<void> initialize() async {
    _log.info('Preloading sound effects');

    await AudioCache.instance.loadAll(SfxType.values
        .expand(soundTypeToFilename)
        .map((path) => 'sfx/$path')
        .toList());

    final disposeListener =
        _ref.read(settingsProvider.notifier).addListener((state) {
      _musicOnHandler();
    });
    state = state.copyWith(disposeListener: disposeListener);
  }

  @override
  void dispose() {
    super.dispose();
    //_lifecycleNotifier?.removeListener(_handleAppLifecycle);
    if (state.disposeListener != null) {
      state.disposeListener!();
    }
    final musicPlayer = state.musicPlayer;
    if (musicPlayer == null) {
      return;
    }
    _stopAllSound();
    musicPlayer.dispose();
    for (final player in state.sfxPlayers) {
      player.dispose();
    }
  }

  /// Plays a single sound effect, defined by [type].
  ///
  /// The controller will ignore this call when the attached settings'
  /// [SettingsController.muted] is `true` or if its
  /// [SettingsController.soundsOn] is `false`.
  void playSfx(SfxType type) {
    final muted = _ref.read(settingsProvider).muted;
    if (muted) {
      _log.info(() => 'Ignoring playing sound ($type) because audio is muted.');
      return;
    }
    final soundsOn = _ref.read(settingsProvider).soundsOn;
    if (!soundsOn) {
      _log.info(() =>
          'Ignoring playing sound ($type) because sounds are turned off.');
      return;
    }

    _log.info(() => 'Playing sound: $type');
    final options = soundTypeToFilename(type);
    final random = state.random;
    if (random == null) {
      return;
    }
    final filename = options[random.nextInt(options.length)];
    _log.info(() => '- Chosen filename: $filename');

    state.sfxPlayers[state.currentSfxPlayer]
        .play(AssetSource('sfx/$filename'), volume: soundTypeToVolume(type));
    state = state.copyWith(
        currentSfxPlayer:
            (state.currentSfxPlayer + 1) % state.sfxPlayers.length);
  }

  void _changeSong(void _) {
    _log.info('Last song finished playing.');
    // Put the song that just finished playing to the end of the playlist.
    final playlist = state.playlist;
    if (playlist == null) {
      return;
    }
    playlist.addLast(playlist.removeFirst());
    // Play the next song.
    _playFirstSongInPlaylist();
  }

  void _musicOnHandler() {
    final settings = _ref.read(settingsProvider);
    if (settings.musicOn && !settings.muted) {
      // Music got turned on.
      /*if (settings.muted) {
        _resumeMusic();
      }*/
      _resumeMusic();
    } else {
      // Music got turned off.
      _stopMusic();
    }
  }

  void _mutedHandler() {
    final settings = _ref.read(settingsProvider);
    if (settings.muted) {
      // All sound just got muted.
      _stopAllSound();
    } else {
      // All sound just got un-muted.
      if (settings.musicOn) {
        _resumeMusic();
      }
    }
  }

  Future<void> _playFirstSongInPlaylist() async {
    final playlist = state.playlist;
    final musicPlayer = state.musicPlayer;
    if (playlist == null || musicPlayer == null) {
      return;
    }
    _log.info(() => 'Playing ${playlist.first} now.');
    await musicPlayer.play(AssetSource('music/${playlist.first.filename}'));
  }

  Future<void> _resumeMusic() async {
    _log.info('Resuming music');
    final musicPlayer = state.musicPlayer;
    if (musicPlayer == null) {
      return;
    }
    switch (musicPlayer.state) {
      case PlayerState.paused:
        _log.info('Calling _musicPlayer.resume()');
        try {
          await musicPlayer.resume();
        } on Exception catch (e) {
          // Sometimes, resuming fails with an "Unexpected" error.
          _log.severe(e);
          await _playFirstSongInPlaylist();
        }
        break;
      case PlayerState.stopped:
        _log.info("resumeMusic() called when music is stopped. "
            "This probably means we haven't yet started the music. "
            "For example, the game was started with sound off.");
        await _playFirstSongInPlaylist();
        break;
      case PlayerState.playing:
        _log.warning('resumeMusic() called when music is playing. '
            'Nothing to do.');
        break;
      case PlayerState.completed:
        _log.warning('resumeMusic() called when music is completed. '
            "Music should never be 'completed' as it's either not playing "
            "or looping forever.");
        await _playFirstSongInPlaylist();
        break;
    }
  }

  void _soundsOnHandler() {
    for (final player in state.sfxPlayers) {
      if (player.state == PlayerState.playing) {
        player.stop();
      }
    }
  }

  void _startMusic() {
    _log.info('starting music');
    _playFirstSongInPlaylist();
  }

  void _stopAllSound() {
    final musicPlayer = state.musicPlayer;
    if (musicPlayer == null) {
      return;
    }
    if (musicPlayer.state == PlayerState.playing) {
      musicPlayer.pause();
    }
    for (final player in state.sfxPlayers) {
      player.stop();
    }
  }

  void _stopMusic() {
    _log.info('Stopping music');
    final musicPlayer = state.musicPlayer;
    if (musicPlayer == null) {
      return;
    }
    if (musicPlayer.state == PlayerState.playing) {
      musicPlayer.pause();
    }
  }
}
