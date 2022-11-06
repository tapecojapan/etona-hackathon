// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'etonas_naming_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EtonasNamingState {
  List<Etona> get etonas => throw _privateConstructorUsedError;
  LoadingType get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EtonasNamingStateCopyWith<EtonasNamingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EtonasNamingStateCopyWith<$Res> {
  factory $EtonasNamingStateCopyWith(
          EtonasNamingState value, $Res Function(EtonasNamingState) then) =
      _$EtonasNamingStateCopyWithImpl<$Res>;
  $Res call({List<Etona> etonas, LoadingType isLoading});
}

/// @nodoc
class _$EtonasNamingStateCopyWithImpl<$Res>
    implements $EtonasNamingStateCopyWith<$Res> {
  _$EtonasNamingStateCopyWithImpl(this._value, this._then);

  final EtonasNamingState _value;
  // ignore: unused_field
  final $Res Function(EtonasNamingState) _then;

  @override
  $Res call({
    Object? etonas = freezed,
    Object? isLoading = freezed,
  }) {
    return _then(_value.copyWith(
      etonas: etonas == freezed
          ? _value.etonas
          : etonas // ignore: cast_nullable_to_non_nullable
              as List<Etona>,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as LoadingType,
    ));
  }
}

/// @nodoc
abstract class _$$_EtonasNamingStateCopyWith<$Res>
    implements $EtonasNamingStateCopyWith<$Res> {
  factory _$$_EtonasNamingStateCopyWith(_$_EtonasNamingState value,
          $Res Function(_$_EtonasNamingState) then) =
      __$$_EtonasNamingStateCopyWithImpl<$Res>;
  @override
  $Res call({List<Etona> etonas, LoadingType isLoading});
}

/// @nodoc
class __$$_EtonasNamingStateCopyWithImpl<$Res>
    extends _$EtonasNamingStateCopyWithImpl<$Res>
    implements _$$_EtonasNamingStateCopyWith<$Res> {
  __$$_EtonasNamingStateCopyWithImpl(
      _$_EtonasNamingState _value, $Res Function(_$_EtonasNamingState) _then)
      : super(_value, (v) => _then(v as _$_EtonasNamingState));

  @override
  _$_EtonasNamingState get _value => super._value as _$_EtonasNamingState;

  @override
  $Res call({
    Object? etonas = freezed,
    Object? isLoading = freezed,
  }) {
    return _then(_$_EtonasNamingState(
      etonas: etonas == freezed
          ? _value._etonas
          : etonas // ignore: cast_nullable_to_non_nullable
              as List<Etona>,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as LoadingType,
    ));
  }
}

/// @nodoc

class _$_EtonasNamingState extends _EtonasNamingState
    with DiagnosticableTreeMixin {
  _$_EtonasNamingState(
      {final List<Etona> etonas = const <Etona>[],
      this.isLoading = LoadingType.loading})
      : _etonas = etonas,
        super._();

  final List<Etona> _etonas;
  @override
  @JsonKey()
  List<Etona> get etonas {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_etonas);
  }

  @override
  @JsonKey()
  final LoadingType isLoading;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EtonasNamingState(etonas: $etonas, isLoading: $isLoading)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'EtonasNamingState'))
      ..add(DiagnosticsProperty('etonas', etonas))
      ..add(DiagnosticsProperty('isLoading', isLoading));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EtonasNamingState &&
            const DeepCollectionEquality().equals(other._etonas, _etonas) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_etonas),
      const DeepCollectionEquality().hash(isLoading));

  @JsonKey(ignore: true)
  @override
  _$$_EtonasNamingStateCopyWith<_$_EtonasNamingState> get copyWith =>
      __$$_EtonasNamingStateCopyWithImpl<_$_EtonasNamingState>(
          this, _$identity);
}

abstract class _EtonasNamingState extends EtonasNamingState {
  factory _EtonasNamingState(
      {final List<Etona> etonas,
      final LoadingType isLoading}) = _$_EtonasNamingState;
  _EtonasNamingState._() : super._();

  @override
  List<Etona> get etonas;
  @override
  LoadingType get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$_EtonasNamingStateCopyWith<_$_EtonasNamingState> get copyWith =>
      throw _privateConstructorUsedError;
}
