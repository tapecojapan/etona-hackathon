// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'answer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Answer _$AnswerFromJson(Map<String, dynamic> json) {
  return _Answer.fromJson(json);
}

/// @nodoc
mixin _$Answer {
  String? get id => throw _privateConstructorUsedError;
  String? get etonaId => throw _privateConstructorUsedError;
  String? get playerId => throw _privateConstructorUsedError;
  int? get tapMilliseconds => throw _privateConstructorUsedError;
  String? get imageAnswer => throw _privateConstructorUsedError;
  String? get nameAnswer => throw _privateConstructorUsedError;
  @CreatedAtField()
  DateTime? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnswerCopyWith<Answer> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnswerCopyWith<$Res> {
  factory $AnswerCopyWith(Answer value, $Res Function(Answer) then) =
      _$AnswerCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      String? etonaId,
      String? playerId,
      int? tapMilliseconds,
      String? imageAnswer,
      String? nameAnswer,
      @CreatedAtField() DateTime? createdAt});
}

/// @nodoc
class _$AnswerCopyWithImpl<$Res> implements $AnswerCopyWith<$Res> {
  _$AnswerCopyWithImpl(this._value, this._then);

  final Answer _value;
  // ignore: unused_field
  final $Res Function(Answer) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? etonaId = freezed,
    Object? playerId = freezed,
    Object? tapMilliseconds = freezed,
    Object? imageAnswer = freezed,
    Object? nameAnswer = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      etonaId: etonaId == freezed
          ? _value.etonaId
          : etonaId // ignore: cast_nullable_to_non_nullable
              as String?,
      playerId: playerId == freezed
          ? _value.playerId
          : playerId // ignore: cast_nullable_to_non_nullable
              as String?,
      tapMilliseconds: tapMilliseconds == freezed
          ? _value.tapMilliseconds
          : tapMilliseconds // ignore: cast_nullable_to_non_nullable
              as int?,
      imageAnswer: imageAnswer == freezed
          ? _value.imageAnswer
          : imageAnswer // ignore: cast_nullable_to_non_nullable
              as String?,
      nameAnswer: nameAnswer == freezed
          ? _value.nameAnswer
          : nameAnswer // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
abstract class _$$_AnswerCopyWith<$Res> implements $AnswerCopyWith<$Res> {
  factory _$$_AnswerCopyWith(_$_Answer value, $Res Function(_$_Answer) then) =
      __$$_AnswerCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      String? etonaId,
      String? playerId,
      int? tapMilliseconds,
      String? imageAnswer,
      String? nameAnswer,
      @CreatedAtField() DateTime? createdAt});
}

/// @nodoc
class __$$_AnswerCopyWithImpl<$Res> extends _$AnswerCopyWithImpl<$Res>
    implements _$$_AnswerCopyWith<$Res> {
  __$$_AnswerCopyWithImpl(_$_Answer _value, $Res Function(_$_Answer) _then)
      : super(_value, (v) => _then(v as _$_Answer));

  @override
  _$_Answer get _value => super._value as _$_Answer;

  @override
  $Res call({
    Object? id = freezed,
    Object? etonaId = freezed,
    Object? playerId = freezed,
    Object? tapMilliseconds = freezed,
    Object? imageAnswer = freezed,
    Object? nameAnswer = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$_Answer(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      etonaId: etonaId == freezed
          ? _value.etonaId
          : etonaId // ignore: cast_nullable_to_non_nullable
              as String?,
      playerId: playerId == freezed
          ? _value.playerId
          : playerId // ignore: cast_nullable_to_non_nullable
              as String?,
      tapMilliseconds: tapMilliseconds == freezed
          ? _value.tapMilliseconds
          : tapMilliseconds // ignore: cast_nullable_to_non_nullable
              as int?,
      imageAnswer: imageAnswer == freezed
          ? _value.imageAnswer
          : imageAnswer // ignore: cast_nullable_to_non_nullable
              as String?,
      nameAnswer: nameAnswer == freezed
          ? _value.nameAnswer
          : nameAnswer // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Answer with DiagnosticableTreeMixin implements _Answer {
  _$_Answer(
      {this.id,
      this.etonaId,
      this.playerId,
      this.tapMilliseconds,
      this.imageAnswer,
      this.nameAnswer,
      @CreatedAtField() this.createdAt});

  factory _$_Answer.fromJson(Map<String, dynamic> json) =>
      _$$_AnswerFromJson(json);

  @override
  final String? id;
  @override
  final String? etonaId;
  @override
  final String? playerId;
  @override
  final int? tapMilliseconds;
  @override
  final String? imageAnswer;
  @override
  final String? nameAnswer;
  @override
  @CreatedAtField()
  final DateTime? createdAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Answer(id: $id, etonaId: $etonaId, playerId: $playerId, tapMilliseconds: $tapMilliseconds, imageAnswer: $imageAnswer, nameAnswer: $nameAnswer, createdAt: $createdAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Answer'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('etonaId', etonaId))
      ..add(DiagnosticsProperty('playerId', playerId))
      ..add(DiagnosticsProperty('tapMilliseconds', tapMilliseconds))
      ..add(DiagnosticsProperty('imageAnswer', imageAnswer))
      ..add(DiagnosticsProperty('nameAnswer', nameAnswer))
      ..add(DiagnosticsProperty('createdAt', createdAt));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Answer &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.etonaId, etonaId) &&
            const DeepCollectionEquality().equals(other.playerId, playerId) &&
            const DeepCollectionEquality()
                .equals(other.tapMilliseconds, tapMilliseconds) &&
            const DeepCollectionEquality()
                .equals(other.imageAnswer, imageAnswer) &&
            const DeepCollectionEquality()
                .equals(other.nameAnswer, nameAnswer) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(etonaId),
      const DeepCollectionEquality().hash(playerId),
      const DeepCollectionEquality().hash(tapMilliseconds),
      const DeepCollectionEquality().hash(imageAnswer),
      const DeepCollectionEquality().hash(nameAnswer),
      const DeepCollectionEquality().hash(createdAt));

  @JsonKey(ignore: true)
  @override
  _$$_AnswerCopyWith<_$_Answer> get copyWith =>
      __$$_AnswerCopyWithImpl<_$_Answer>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AnswerToJson(
      this,
    );
  }
}

abstract class _Answer implements Answer {
  factory _Answer(
      {final String? id,
      final String? etonaId,
      final String? playerId,
      final int? tapMilliseconds,
      final String? imageAnswer,
      final String? nameAnswer,
      @CreatedAtField() final DateTime? createdAt}) = _$_Answer;

  factory _Answer.fromJson(Map<String, dynamic> json) = _$_Answer.fromJson;

  @override
  String? get id;
  @override
  String? get etonaId;
  @override
  String? get playerId;
  @override
  int? get tapMilliseconds;
  @override
  String? get imageAnswer;
  @override
  String? get nameAnswer;
  @override
  @CreatedAtField()
  DateTime? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$_AnswerCopyWith<_$_Answer> get copyWith =>
      throw _privateConstructorUsedError;
}
