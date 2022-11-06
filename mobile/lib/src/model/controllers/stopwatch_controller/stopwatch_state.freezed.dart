// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'stopwatch_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$StopwatchState {
  Stopwatch? get stopwatch => throw _privateConstructorUsedError;
  Timer? get timer => throw _privateConstructorUsedError;
  int get elapsedMilliseconds => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StopwatchStateCopyWith<StopwatchState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StopwatchStateCopyWith<$Res> {
  factory $StopwatchStateCopyWith(
          StopwatchState value, $Res Function(StopwatchState) then) =
      _$StopwatchStateCopyWithImpl<$Res>;
  $Res call({Stopwatch? stopwatch, Timer? timer, int elapsedMilliseconds});
}

/// @nodoc
class _$StopwatchStateCopyWithImpl<$Res>
    implements $StopwatchStateCopyWith<$Res> {
  _$StopwatchStateCopyWithImpl(this._value, this._then);

  final StopwatchState _value;
  // ignore: unused_field
  final $Res Function(StopwatchState) _then;

  @override
  $Res call({
    Object? stopwatch = freezed,
    Object? timer = freezed,
    Object? elapsedMilliseconds = freezed,
  }) {
    return _then(_value.copyWith(
      stopwatch: stopwatch == freezed
          ? _value.stopwatch
          : stopwatch // ignore: cast_nullable_to_non_nullable
              as Stopwatch?,
      timer: timer == freezed
          ? _value.timer
          : timer // ignore: cast_nullable_to_non_nullable
              as Timer?,
      elapsedMilliseconds: elapsedMilliseconds == freezed
          ? _value.elapsedMilliseconds
          : elapsedMilliseconds // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_StopwatchStateCopyWith<$Res>
    implements $StopwatchStateCopyWith<$Res> {
  factory _$$_StopwatchStateCopyWith(
          _$_StopwatchState value, $Res Function(_$_StopwatchState) then) =
      __$$_StopwatchStateCopyWithImpl<$Res>;
  @override
  $Res call({Stopwatch? stopwatch, Timer? timer, int elapsedMilliseconds});
}

/// @nodoc
class __$$_StopwatchStateCopyWithImpl<$Res>
    extends _$StopwatchStateCopyWithImpl<$Res>
    implements _$$_StopwatchStateCopyWith<$Res> {
  __$$_StopwatchStateCopyWithImpl(
      _$_StopwatchState _value, $Res Function(_$_StopwatchState) _then)
      : super(_value, (v) => _then(v as _$_StopwatchState));

  @override
  _$_StopwatchState get _value => super._value as _$_StopwatchState;

  @override
  $Res call({
    Object? stopwatch = freezed,
    Object? timer = freezed,
    Object? elapsedMilliseconds = freezed,
  }) {
    return _then(_$_StopwatchState(
      stopwatch: stopwatch == freezed
          ? _value.stopwatch
          : stopwatch // ignore: cast_nullable_to_non_nullable
              as Stopwatch?,
      timer: timer == freezed
          ? _value.timer
          : timer // ignore: cast_nullable_to_non_nullable
              as Timer?,
      elapsedMilliseconds: elapsedMilliseconds == freezed
          ? _value.elapsedMilliseconds
          : elapsedMilliseconds // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_StopwatchState extends _StopwatchState {
  _$_StopwatchState({this.stopwatch, this.timer, this.elapsedMilliseconds = 0})
      : super._();

  @override
  final Stopwatch? stopwatch;
  @override
  final Timer? timer;
  @override
  @JsonKey()
  final int elapsedMilliseconds;

  @override
  String toString() {
    return 'StopwatchState(stopwatch: $stopwatch, timer: $timer, elapsedMilliseconds: $elapsedMilliseconds)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StopwatchState &&
            const DeepCollectionEquality().equals(other.stopwatch, stopwatch) &&
            const DeepCollectionEquality().equals(other.timer, timer) &&
            const DeepCollectionEquality()
                .equals(other.elapsedMilliseconds, elapsedMilliseconds));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(stopwatch),
      const DeepCollectionEquality().hash(timer),
      const DeepCollectionEquality().hash(elapsedMilliseconds));

  @JsonKey(ignore: true)
  @override
  _$$_StopwatchStateCopyWith<_$_StopwatchState> get copyWith =>
      __$$_StopwatchStateCopyWithImpl<_$_StopwatchState>(this, _$identity);
}

abstract class _StopwatchState extends StopwatchState {
  factory _StopwatchState(
      {final Stopwatch? stopwatch,
      final Timer? timer,
      final int elapsedMilliseconds}) = _$_StopwatchState;
  _StopwatchState._() : super._();

  @override
  Stopwatch? get stopwatch;
  @override
  Timer? get timer;
  @override
  int get elapsedMilliseconds;
  @override
  @JsonKey(ignore: true)
  _$$_StopwatchStateCopyWith<_$_StopwatchState> get copyWith =>
      throw _privateConstructorUsedError;
}
