// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'etona.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Etona _$EtonaFromJson(Map<String, dynamic> json) {
  return _Etona.fromJson(json);
}

/// @nodoc
mixin _$Etona {
  String get id => throw _privateConstructorUsedError;
  String? get docId => throw _privateConstructorUsedError;
  String? get photoURL => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get godparentId => throw _privateConstructorUsedError;
  int? get order => throw _privateConstructorUsedError;
  int? get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EtonaCopyWith<Etona> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EtonaCopyWith<$Res> {
  factory $EtonaCopyWith(Etona value, $Res Function(Etona) then) =
      _$EtonaCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String? docId,
      String? photoURL,
      String? name,
      String? godparentId,
      int? order,
      int? type});
}

/// @nodoc
class _$EtonaCopyWithImpl<$Res> implements $EtonaCopyWith<$Res> {
  _$EtonaCopyWithImpl(this._value, this._then);

  final Etona _value;
  // ignore: unused_field
  final $Res Function(Etona) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? docId = freezed,
    Object? photoURL = freezed,
    Object? name = freezed,
    Object? godparentId = freezed,
    Object? order = freezed,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      docId: docId == freezed
          ? _value.docId
          : docId // ignore: cast_nullable_to_non_nullable
              as String?,
      photoURL: photoURL == freezed
          ? _value.photoURL
          : photoURL // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      godparentId: godparentId == freezed
          ? _value.godparentId
          : godparentId // ignore: cast_nullable_to_non_nullable
              as String?,
      order: order == freezed
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$$_EtonaCopyWith<$Res> implements $EtonaCopyWith<$Res> {
  factory _$$_EtonaCopyWith(_$_Etona value, $Res Function(_$_Etona) then) =
      __$$_EtonaCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String? docId,
      String? photoURL,
      String? name,
      String? godparentId,
      int? order,
      int? type});
}

/// @nodoc
class __$$_EtonaCopyWithImpl<$Res> extends _$EtonaCopyWithImpl<$Res>
    implements _$$_EtonaCopyWith<$Res> {
  __$$_EtonaCopyWithImpl(_$_Etona _value, $Res Function(_$_Etona) _then)
      : super(_value, (v) => _then(v as _$_Etona));

  @override
  _$_Etona get _value => super._value as _$_Etona;

  @override
  $Res call({
    Object? id = freezed,
    Object? docId = freezed,
    Object? photoURL = freezed,
    Object? name = freezed,
    Object? godparentId = freezed,
    Object? order = freezed,
    Object? type = freezed,
  }) {
    return _then(_$_Etona(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      docId: docId == freezed
          ? _value.docId
          : docId // ignore: cast_nullable_to_non_nullable
              as String?,
      photoURL: photoURL == freezed
          ? _value.photoURL
          : photoURL // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      godparentId: godparentId == freezed
          ? _value.godparentId
          : godparentId // ignore: cast_nullable_to_non_nullable
              as String?,
      order: order == freezed
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Etona with DiagnosticableTreeMixin implements _Etona {
  _$_Etona(
      {required this.id,
      this.docId,
      this.photoURL,
      this.name,
      this.godparentId,
      this.order,
      this.type});

  factory _$_Etona.fromJson(Map<String, dynamic> json) =>
      _$$_EtonaFromJson(json);

  @override
  final String id;
  @override
  final String? docId;
  @override
  final String? photoURL;
  @override
  final String? name;
  @override
  final String? godparentId;
  @override
  final int? order;
  @override
  final int? type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Etona(id: $id, docId: $docId, photoURL: $photoURL, name: $name, godparentId: $godparentId, order: $order, type: $type)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Etona'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('docId', docId))
      ..add(DiagnosticsProperty('photoURL', photoURL))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('godparentId', godparentId))
      ..add(DiagnosticsProperty('order', order))
      ..add(DiagnosticsProperty('type', type));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Etona &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.docId, docId) &&
            const DeepCollectionEquality().equals(other.photoURL, photoURL) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.godparentId, godparentId) &&
            const DeepCollectionEquality().equals(other.order, order) &&
            const DeepCollectionEquality().equals(other.type, type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(docId),
      const DeepCollectionEquality().hash(photoURL),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(godparentId),
      const DeepCollectionEquality().hash(order),
      const DeepCollectionEquality().hash(type));

  @JsonKey(ignore: true)
  @override
  _$$_EtonaCopyWith<_$_Etona> get copyWith =>
      __$$_EtonaCopyWithImpl<_$_Etona>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EtonaToJson(
      this,
    );
  }
}

abstract class _Etona implements Etona {
  factory _Etona(
      {required final String id,
      final String? docId,
      final String? photoURL,
      final String? name,
      final String? godparentId,
      final int? order,
      final int? type}) = _$_Etona;

  factory _Etona.fromJson(Map<String, dynamic> json) = _$_Etona.fromJson;

  @override
  String get id;
  @override
  String? get docId;
  @override
  String? get photoURL;
  @override
  String? get name;
  @override
  String? get godparentId;
  @override
  int? get order;
  @override
  int? get type;
  @override
  @JsonKey(ignore: true)
  _$$_EtonaCopyWith<_$_Etona> get copyWith =>
      throw _privateConstructorUsedError;
}
