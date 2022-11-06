// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'audio_state.gen.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AudioState {
  int get polyphony => throw _privateConstructorUsedError;
  AudioPlayer? get musicPlayer => throw _privateConstructorUsedError;
  List<AudioPlayer> get sfxPlayers => throw _privateConstructorUsedError;
  int get currentSfxPlayer => throw _privateConstructorUsedError;
  Queue<Song>? get playlist => throw _privateConstructorUsedError;
  Random? get random => throw _privateConstructorUsedError;
  void Function()? get disposeListener => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AudioStateCopyWith<AudioState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AudioStateCopyWith<$Res> {
  factory $AudioStateCopyWith(
          AudioState value, $Res Function(AudioState) then) =
      _$AudioStateCopyWithImpl<$Res>;
  $Res call(
      {int polyphony,
      AudioPlayer? musicPlayer,
      List<AudioPlayer> sfxPlayers,
      int currentSfxPlayer,
      Queue<Song>? playlist,
      Random? random,
      void Function()? disposeListener});
}

/// @nodoc
class _$AudioStateCopyWithImpl<$Res> implements $AudioStateCopyWith<$Res> {
  _$AudioStateCopyWithImpl(this._value, this._then);

  final AudioState _value;
  // ignore: unused_field
  final $Res Function(AudioState) _then;

  @override
  $Res call({
    Object? polyphony = freezed,
    Object? musicPlayer = freezed,
    Object? sfxPlayers = freezed,
    Object? currentSfxPlayer = freezed,
    Object? playlist = freezed,
    Object? random = freezed,
    Object? disposeListener = freezed,
  }) {
    return _then(_value.copyWith(
      polyphony: polyphony == freezed
          ? _value.polyphony
          : polyphony // ignore: cast_nullable_to_non_nullable
              as int,
      musicPlayer: musicPlayer == freezed
          ? _value.musicPlayer
          : musicPlayer // ignore: cast_nullable_to_non_nullable
              as AudioPlayer?,
      sfxPlayers: sfxPlayers == freezed
          ? _value.sfxPlayers
          : sfxPlayers // ignore: cast_nullable_to_non_nullable
              as List<AudioPlayer>,
      currentSfxPlayer: currentSfxPlayer == freezed
          ? _value.currentSfxPlayer
          : currentSfxPlayer // ignore: cast_nullable_to_non_nullable
              as int,
      playlist: playlist == freezed
          ? _value.playlist
          : playlist // ignore: cast_nullable_to_non_nullable
              as Queue<Song>?,
      random: random == freezed
          ? _value.random
          : random // ignore: cast_nullable_to_non_nullable
              as Random?,
      disposeListener: disposeListener == freezed
          ? _value.disposeListener
          : disposeListener // ignore: cast_nullable_to_non_nullable
              as void Function()?,
    ));
  }
}

/// @nodoc
abstract class _$$_AudioStateCopyWith<$Res>
    implements $AudioStateCopyWith<$Res> {
  factory _$$_AudioStateCopyWith(
          _$_AudioState value, $Res Function(_$_AudioState) then) =
      __$$_AudioStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {int polyphony,
      AudioPlayer? musicPlayer,
      List<AudioPlayer> sfxPlayers,
      int currentSfxPlayer,
      Queue<Song>? playlist,
      Random? random,
      void Function()? disposeListener});
}

/// @nodoc
class __$$_AudioStateCopyWithImpl<$Res> extends _$AudioStateCopyWithImpl<$Res>
    implements _$$_AudioStateCopyWith<$Res> {
  __$$_AudioStateCopyWithImpl(
      _$_AudioState _value, $Res Function(_$_AudioState) _then)
      : super(_value, (v) => _then(v as _$_AudioState));

  @override
  _$_AudioState get _value => super._value as _$_AudioState;

  @override
  $Res call({
    Object? polyphony = freezed,
    Object? musicPlayer = freezed,
    Object? sfxPlayers = freezed,
    Object? currentSfxPlayer = freezed,
    Object? playlist = freezed,
    Object? random = freezed,
    Object? disposeListener = freezed,
  }) {
    return _then(_$_AudioState(
      polyphony: polyphony == freezed
          ? _value.polyphony
          : polyphony // ignore: cast_nullable_to_non_nullable
              as int,
      musicPlayer: musicPlayer == freezed
          ? _value.musicPlayer
          : musicPlayer // ignore: cast_nullable_to_non_nullable
              as AudioPlayer?,
      sfxPlayers: sfxPlayers == freezed
          ? _value._sfxPlayers
          : sfxPlayers // ignore: cast_nullable_to_non_nullable
              as List<AudioPlayer>,
      currentSfxPlayer: currentSfxPlayer == freezed
          ? _value.currentSfxPlayer
          : currentSfxPlayer // ignore: cast_nullable_to_non_nullable
              as int,
      playlist: playlist == freezed
          ? _value.playlist
          : playlist // ignore: cast_nullable_to_non_nullable
              as Queue<Song>?,
      random: random == freezed
          ? _value.random
          : random // ignore: cast_nullable_to_non_nullable
              as Random?,
      disposeListener: disposeListener == freezed
          ? _value.disposeListener
          : disposeListener // ignore: cast_nullable_to_non_nullable
              as void Function()?,
    ));
  }
}

/// @nodoc

class _$_AudioState with DiagnosticableTreeMixin implements _AudioState {
  _$_AudioState(
      {this.polyphony = 2,
      this.musicPlayer,
      final List<AudioPlayer> sfxPlayers = const <AudioPlayer>[],
      this.currentSfxPlayer = 0,
      this.playlist,
      this.random,
      this.disposeListener})
      : _sfxPlayers = sfxPlayers;

  @override
  @JsonKey()
  final int polyphony;
  @override
  final AudioPlayer? musicPlayer;
  final List<AudioPlayer> _sfxPlayers;
  @override
  @JsonKey()
  List<AudioPlayer> get sfxPlayers {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sfxPlayers);
  }

  @override
  @JsonKey()
  final int currentSfxPlayer;
  @override
  final Queue<Song>? playlist;
  @override
  final Random? random;
  @override
  final void Function()? disposeListener;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AudioState(polyphony: $polyphony, musicPlayer: $musicPlayer, sfxPlayers: $sfxPlayers, currentSfxPlayer: $currentSfxPlayer, playlist: $playlist, random: $random, disposeListener: $disposeListener)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AudioState'))
      ..add(DiagnosticsProperty('polyphony', polyphony))
      ..add(DiagnosticsProperty('musicPlayer', musicPlayer))
      ..add(DiagnosticsProperty('sfxPlayers', sfxPlayers))
      ..add(DiagnosticsProperty('currentSfxPlayer', currentSfxPlayer))
      ..add(DiagnosticsProperty('playlist', playlist))
      ..add(DiagnosticsProperty('random', random))
      ..add(DiagnosticsProperty('disposeListener', disposeListener));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AudioState &&
            const DeepCollectionEquality().equals(other.polyphony, polyphony) &&
            const DeepCollectionEquality()
                .equals(other.musicPlayer, musicPlayer) &&
            const DeepCollectionEquality()
                .equals(other._sfxPlayers, _sfxPlayers) &&
            const DeepCollectionEquality()
                .equals(other.currentSfxPlayer, currentSfxPlayer) &&
            const DeepCollectionEquality().equals(other.playlist, playlist) &&
            const DeepCollectionEquality().equals(other.random, random) &&
            (identical(other.disposeListener, disposeListener) ||
                other.disposeListener == disposeListener));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(polyphony),
      const DeepCollectionEquality().hash(musicPlayer),
      const DeepCollectionEquality().hash(_sfxPlayers),
      const DeepCollectionEquality().hash(currentSfxPlayer),
      const DeepCollectionEquality().hash(playlist),
      const DeepCollectionEquality().hash(random),
      disposeListener);

  @JsonKey(ignore: true)
  @override
  _$$_AudioStateCopyWith<_$_AudioState> get copyWith =>
      __$$_AudioStateCopyWithImpl<_$_AudioState>(this, _$identity);
}

abstract class _AudioState implements AudioState {
  factory _AudioState(
      {final int polyphony,
      final AudioPlayer? musicPlayer,
      final List<AudioPlayer> sfxPlayers,
      final int currentSfxPlayer,
      final Queue<Song>? playlist,
      final Random? random,
      final void Function()? disposeListener}) = _$_AudioState;

  @override
  int get polyphony;
  @override
  AudioPlayer? get musicPlayer;
  @override
  List<AudioPlayer> get sfxPlayers;
  @override
  int get currentSfxPlayer;
  @override
  Queue<Song>? get playlist;
  @override
  Random? get random;
  @override
  void Function()? get disposeListener;
  @override
  @JsonKey(ignore: true)
  _$$_AudioStateCopyWith<_$_AudioState> get copyWith =>
      throw _privateConstructorUsedError;
}
