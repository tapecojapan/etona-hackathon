// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'settings_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SettingsState {
  String get playerName => throw _privateConstructorUsedError;
  bool get muted => throw _privateConstructorUsedError;
  bool get soundsOn => throw _privateConstructorUsedError;
  bool get musicOn => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SettingsStateCopyWith<SettingsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsStateCopyWith<$Res> {
  factory $SettingsStateCopyWith(
          SettingsState value, $Res Function(SettingsState) then) =
      _$SettingsStateCopyWithImpl<$Res>;
  $Res call({String playerName, bool muted, bool soundsOn, bool musicOn});
}

/// @nodoc
class _$SettingsStateCopyWithImpl<$Res>
    implements $SettingsStateCopyWith<$Res> {
  _$SettingsStateCopyWithImpl(this._value, this._then);

  final SettingsState _value;
  // ignore: unused_field
  final $Res Function(SettingsState) _then;

  @override
  $Res call({
    Object? playerName = freezed,
    Object? muted = freezed,
    Object? soundsOn = freezed,
    Object? musicOn = freezed,
  }) {
    return _then(_value.copyWith(
      playerName: playerName == freezed
          ? _value.playerName
          : playerName // ignore: cast_nullable_to_non_nullable
              as String,
      muted: muted == freezed
          ? _value.muted
          : muted // ignore: cast_nullable_to_non_nullable
              as bool,
      soundsOn: soundsOn == freezed
          ? _value.soundsOn
          : soundsOn // ignore: cast_nullable_to_non_nullable
              as bool,
      musicOn: musicOn == freezed
          ? _value.musicOn
          : musicOn // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_SettingsStateCopyWith<$Res>
    implements $SettingsStateCopyWith<$Res> {
  factory _$$_SettingsStateCopyWith(
          _$_SettingsState value, $Res Function(_$_SettingsState) then) =
      __$$_SettingsStateCopyWithImpl<$Res>;
  @override
  $Res call({String playerName, bool muted, bool soundsOn, bool musicOn});
}

/// @nodoc
class __$$_SettingsStateCopyWithImpl<$Res>
    extends _$SettingsStateCopyWithImpl<$Res>
    implements _$$_SettingsStateCopyWith<$Res> {
  __$$_SettingsStateCopyWithImpl(
      _$_SettingsState _value, $Res Function(_$_SettingsState) _then)
      : super(_value, (v) => _then(v as _$_SettingsState));

  @override
  _$_SettingsState get _value => super._value as _$_SettingsState;

  @override
  $Res call({
    Object? playerName = freezed,
    Object? muted = freezed,
    Object? soundsOn = freezed,
    Object? musicOn = freezed,
  }) {
    return _then(_$_SettingsState(
      playerName: playerName == freezed
          ? _value.playerName
          : playerName // ignore: cast_nullable_to_non_nullable
              as String,
      muted: muted == freezed
          ? _value.muted
          : muted // ignore: cast_nullable_to_non_nullable
              as bool,
      soundsOn: soundsOn == freezed
          ? _value.soundsOn
          : soundsOn // ignore: cast_nullable_to_non_nullable
              as bool,
      musicOn: musicOn == freezed
          ? _value.musicOn
          : musicOn // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_SettingsState extends _SettingsState with DiagnosticableTreeMixin {
  _$_SettingsState(
      {this.playerName = 'Player',
      this.muted = false,
      this.soundsOn = true,
      this.musicOn = true})
      : super._();

  @override
  @JsonKey()
  final String playerName;
  @override
  @JsonKey()
  final bool muted;
  @override
  @JsonKey()
  final bool soundsOn;
  @override
  @JsonKey()
  final bool musicOn;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SettingsState(playerName: $playerName, muted: $muted, soundsOn: $soundsOn, musicOn: $musicOn)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SettingsState'))
      ..add(DiagnosticsProperty('playerName', playerName))
      ..add(DiagnosticsProperty('muted', muted))
      ..add(DiagnosticsProperty('soundsOn', soundsOn))
      ..add(DiagnosticsProperty('musicOn', musicOn));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SettingsState &&
            const DeepCollectionEquality()
                .equals(other.playerName, playerName) &&
            const DeepCollectionEquality().equals(other.muted, muted) &&
            const DeepCollectionEquality().equals(other.soundsOn, soundsOn) &&
            const DeepCollectionEquality().equals(other.musicOn, musicOn));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(playerName),
      const DeepCollectionEquality().hash(muted),
      const DeepCollectionEquality().hash(soundsOn),
      const DeepCollectionEquality().hash(musicOn));

  @JsonKey(ignore: true)
  @override
  _$$_SettingsStateCopyWith<_$_SettingsState> get copyWith =>
      __$$_SettingsStateCopyWithImpl<_$_SettingsState>(this, _$identity);
}

abstract class _SettingsState extends SettingsState {
  factory _SettingsState(
      {final String playerName,
      final bool muted,
      final bool soundsOn,
      final bool musicOn}) = _$_SettingsState;
  _SettingsState._() : super._();

  @override
  String get playerName;
  @override
  bool get muted;
  @override
  bool get soundsOn;
  @override
  bool get musicOn;
  @override
  @JsonKey(ignore: true)
  _$$_SettingsStateCopyWith<_$_SettingsState> get copyWith =>
      throw _privateConstructorUsedError;
}
