// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'victory_count.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

VictoryCount _$VictoryCountFromJson(Map<String, dynamic> json) {
  return _VictoryCount.fromJson(json);
}

/// @nodoc
mixin _$VictoryCount {
  String? get playerId => throw _privateConstructorUsedError;
  int? get count => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VictoryCountCopyWith<VictoryCount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VictoryCountCopyWith<$Res> {
  factory $VictoryCountCopyWith(
          VictoryCount value, $Res Function(VictoryCount) then) =
      _$VictoryCountCopyWithImpl<$Res>;
  $Res call({String? playerId, int? count});
}

/// @nodoc
class _$VictoryCountCopyWithImpl<$Res> implements $VictoryCountCopyWith<$Res> {
  _$VictoryCountCopyWithImpl(this._value, this._then);

  final VictoryCount _value;
  // ignore: unused_field
  final $Res Function(VictoryCount) _then;

  @override
  $Res call({
    Object? playerId = freezed,
    Object? count = freezed,
  }) {
    return _then(_value.copyWith(
      playerId: playerId == freezed
          ? _value.playerId
          : playerId // ignore: cast_nullable_to_non_nullable
              as String?,
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$$_VictoryCountCopyWith<$Res>
    implements $VictoryCountCopyWith<$Res> {
  factory _$$_VictoryCountCopyWith(
          _$_VictoryCount value, $Res Function(_$_VictoryCount) then) =
      __$$_VictoryCountCopyWithImpl<$Res>;
  @override
  $Res call({String? playerId, int? count});
}

/// @nodoc
class __$$_VictoryCountCopyWithImpl<$Res>
    extends _$VictoryCountCopyWithImpl<$Res>
    implements _$$_VictoryCountCopyWith<$Res> {
  __$$_VictoryCountCopyWithImpl(
      _$_VictoryCount _value, $Res Function(_$_VictoryCount) _then)
      : super(_value, (v) => _then(v as _$_VictoryCount));

  @override
  _$_VictoryCount get _value => super._value as _$_VictoryCount;

  @override
  $Res call({
    Object? playerId = freezed,
    Object? count = freezed,
  }) {
    return _then(_$_VictoryCount(
      playerId: playerId == freezed
          ? _value.playerId
          : playerId // ignore: cast_nullable_to_non_nullable
              as String?,
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_VictoryCount with DiagnosticableTreeMixin implements _VictoryCount {
  _$_VictoryCount({this.playerId, this.count});

  factory _$_VictoryCount.fromJson(Map<String, dynamic> json) =>
      _$$_VictoryCountFromJson(json);

  @override
  final String? playerId;
  @override
  final int? count;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'VictoryCount(playerId: $playerId, count: $count)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'VictoryCount'))
      ..add(DiagnosticsProperty('playerId', playerId))
      ..add(DiagnosticsProperty('count', count));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_VictoryCount &&
            const DeepCollectionEquality().equals(other.playerId, playerId) &&
            const DeepCollectionEquality().equals(other.count, count));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(playerId),
      const DeepCollectionEquality().hash(count));

  @JsonKey(ignore: true)
  @override
  _$$_VictoryCountCopyWith<_$_VictoryCount> get copyWith =>
      __$$_VictoryCountCopyWithImpl<_$_VictoryCount>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_VictoryCountToJson(
      this,
    );
  }
}

abstract class _VictoryCount implements VictoryCount {
  factory _VictoryCount({final String? playerId, final int? count}) =
      _$_VictoryCount;

  factory _VictoryCount.fromJson(Map<String, dynamic> json) =
      _$_VictoryCount.fromJson;

  @override
  String? get playerId;
  @override
  int? get count;
  @override
  @JsonKey(ignore: true)
  _$$_VictoryCountCopyWith<_$_VictoryCount> get copyWith =>
      throw _privateConstructorUsedError;
}
