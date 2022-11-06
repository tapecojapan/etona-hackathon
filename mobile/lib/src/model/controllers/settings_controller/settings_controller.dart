import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'settings_state.dart';
export 'settings_state.dart';

final settingsProvider =
    StateNotifierProvider<SettingsController, SettingsState>(
        SettingsController.new);

class SettingsController extends StateNotifier<SettingsState> {
  SettingsController(this._ref) : super(SettingsState()) {
    () async {
      await init();
    }();
  }

  final StateNotifierProviderRef<SettingsController, SettingsState> _ref;

  Future<void> init() async {
    await Future.wait([
      getPlayerName()
          .then((value) => state = state.copyWith(playerName: value)),
      getMusicOn().then((value) => state = state.copyWith(musicOn: value)),
      getSoundsOn().then((value) => state = state.copyWith(soundsOn: value)),
      getMuted(defaultValue: kIsWeb)
          .then((value) => state = state.copyWith(muted: value)),
    ]);
  }

  Future<bool> getMusicOn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('musicOn') ?? true;
  }

  Future<bool> getMuted({required bool defaultValue}) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('mute') ?? defaultValue;
  }

  Future<String> getPlayerName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('playerName') ?? 'Player';
  }

  Future<bool> getSoundsOn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('soundsOn') ?? true;
  }

  Future<void> saveMusicOn({required bool value}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('musicOn', value);
  }

  Future<void> saveMuted({required bool value}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('mute', value);
  }

  Future<void> savePlayerName(String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('playerName', value);
  }

  Future<void> saveSoundsOn({required bool value}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('soundsOn', value);
  }

  void setPlayerName(String name) {
    state = state.copyWith(playerName: name);
    savePlayerName(state.playerName);
  }

  void toggleMusicOn() {
    state = state.copyWith(musicOn: !state.musicOn);
    saveMusicOn(value: state.musicOn);
  }

  void toggleMuted() {
    state = state.copyWith(muted: !state.muted);
    saveMuted(value: state.muted);
  }

  void toggleSoundsOn() {
    state = state.copyWith(soundsOn: !state.soundsOn);
    saveSoundsOn(value: state.soundsOn);
  }
}
