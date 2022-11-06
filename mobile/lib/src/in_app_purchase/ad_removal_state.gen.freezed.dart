// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'ad_removal_state.gen.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AdRemovalPurchaseState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notStarted,
    required TResult Function() pending,
    required TResult Function() active,
    required TResult Function(Object error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? notStarted,
    TResult Function()? pending,
    TResult Function()? active,
    TResult Function(Object error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notStarted,
    TResult Function()? pending,
    TResult Function()? active,
    TResult Function(Object error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NotStarted value) notStarted,
    required TResult Function(_Pending value) pending,
    required TResult Function(_Active value) active,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_NotStarted value)? notStarted,
    TResult Function(_Pending value)? pending,
    TResult Function(_Active value)? active,
    TResult Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NotStarted value)? notStarted,
    TResult Function(_Pending value)? pending,
    TResult Function(_Active value)? active,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdRemovalPurchaseStateCopyWith<$Res> {
  factory $AdRemovalPurchaseStateCopyWith(AdRemovalPurchaseState value,
          $Res Function(AdRemovalPurchaseState) then) =
      _$AdRemovalPurchaseStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$AdRemovalPurchaseStateCopyWithImpl<$Res>
    implements $AdRemovalPurchaseStateCopyWith<$Res> {
  _$AdRemovalPurchaseStateCopyWithImpl(this._value, this._then);

  final AdRemovalPurchaseState _value;
  // ignore: unused_field
  final $Res Function(AdRemovalPurchaseState) _then;
}

/// @nodoc
abstract class _$$_NotStartedCopyWith<$Res> {
  factory _$$_NotStartedCopyWith(
          _$_NotStarted value, $Res Function(_$_NotStarted) then) =
      __$$_NotStartedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_NotStartedCopyWithImpl<$Res>
    extends _$AdRemovalPurchaseStateCopyWithImpl<$Res>
    implements _$$_NotStartedCopyWith<$Res> {
  __$$_NotStartedCopyWithImpl(
      _$_NotStarted _value, $Res Function(_$_NotStarted) _then)
      : super(_value, (v) => _then(v as _$_NotStarted));

  @override
  _$_NotStarted get _value => super._value as _$_NotStarted;
}

/// @nodoc

class _$_NotStarted with DiagnosticableTreeMixin implements _NotStarted {
  _$_NotStarted();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AdRemovalPurchaseState.notStarted()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty('type', 'AdRemovalPurchaseState.notStarted'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_NotStarted);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notStarted,
    required TResult Function() pending,
    required TResult Function() active,
    required TResult Function(Object error) error,
  }) {
    return notStarted();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? notStarted,
    TResult Function()? pending,
    TResult Function()? active,
    TResult Function(Object error)? error,
  }) {
    return notStarted?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notStarted,
    TResult Function()? pending,
    TResult Function()? active,
    TResult Function(Object error)? error,
    required TResult orElse(),
  }) {
    if (notStarted != null) {
      return notStarted();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NotStarted value) notStarted,
    required TResult Function(_Pending value) pending,
    required TResult Function(_Active value) active,
    required TResult Function(_Error value) error,
  }) {
    return notStarted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_NotStarted value)? notStarted,
    TResult Function(_Pending value)? pending,
    TResult Function(_Active value)? active,
    TResult Function(_Error value)? error,
  }) {
    return notStarted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NotStarted value)? notStarted,
    TResult Function(_Pending value)? pending,
    TResult Function(_Active value)? active,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (notStarted != null) {
      return notStarted(this);
    }
    return orElse();
  }
}

abstract class _NotStarted implements AdRemovalPurchaseState {
  factory _NotStarted() = _$_NotStarted;
}

/// @nodoc
abstract class _$$_PendingCopyWith<$Res> {
  factory _$$_PendingCopyWith(
          _$_Pending value, $Res Function(_$_Pending) then) =
      __$$_PendingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_PendingCopyWithImpl<$Res>
    extends _$AdRemovalPurchaseStateCopyWithImpl<$Res>
    implements _$$_PendingCopyWith<$Res> {
  __$$_PendingCopyWithImpl(_$_Pending _value, $Res Function(_$_Pending) _then)
      : super(_value, (v) => _then(v as _$_Pending));

  @override
  _$_Pending get _value => super._value as _$_Pending;
}

/// @nodoc

class _$_Pending with DiagnosticableTreeMixin implements _Pending {
  _$_Pending();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AdRemovalPurchaseState.pending()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty('type', 'AdRemovalPurchaseState.pending'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Pending);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notStarted,
    required TResult Function() pending,
    required TResult Function() active,
    required TResult Function(Object error) error,
  }) {
    return pending();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? notStarted,
    TResult Function()? pending,
    TResult Function()? active,
    TResult Function(Object error)? error,
  }) {
    return pending?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notStarted,
    TResult Function()? pending,
    TResult Function()? active,
    TResult Function(Object error)? error,
    required TResult orElse(),
  }) {
    if (pending != null) {
      return pending();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NotStarted value) notStarted,
    required TResult Function(_Pending value) pending,
    required TResult Function(_Active value) active,
    required TResult Function(_Error value) error,
  }) {
    return pending(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_NotStarted value)? notStarted,
    TResult Function(_Pending value)? pending,
    TResult Function(_Active value)? active,
    TResult Function(_Error value)? error,
  }) {
    return pending?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NotStarted value)? notStarted,
    TResult Function(_Pending value)? pending,
    TResult Function(_Active value)? active,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (pending != null) {
      return pending(this);
    }
    return orElse();
  }
}

abstract class _Pending implements AdRemovalPurchaseState {
  factory _Pending() = _$_Pending;
}

/// @nodoc
abstract class _$$_ActiveCopyWith<$Res> {
  factory _$$_ActiveCopyWith(_$_Active value, $Res Function(_$_Active) then) =
      __$$_ActiveCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ActiveCopyWithImpl<$Res>
    extends _$AdRemovalPurchaseStateCopyWithImpl<$Res>
    implements _$$_ActiveCopyWith<$Res> {
  __$$_ActiveCopyWithImpl(_$_Active _value, $Res Function(_$_Active) _then)
      : super(_value, (v) => _then(v as _$_Active));

  @override
  _$_Active get _value => super._value as _$_Active;
}

/// @nodoc

class _$_Active with DiagnosticableTreeMixin implements _Active {
  _$_Active();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AdRemovalPurchaseState.active()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty('type', 'AdRemovalPurchaseState.active'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Active);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notStarted,
    required TResult Function() pending,
    required TResult Function() active,
    required TResult Function(Object error) error,
  }) {
    return active();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? notStarted,
    TResult Function()? pending,
    TResult Function()? active,
    TResult Function(Object error)? error,
  }) {
    return active?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notStarted,
    TResult Function()? pending,
    TResult Function()? active,
    TResult Function(Object error)? error,
    required TResult orElse(),
  }) {
    if (active != null) {
      return active();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NotStarted value) notStarted,
    required TResult Function(_Pending value) pending,
    required TResult Function(_Active value) active,
    required TResult Function(_Error value) error,
  }) {
    return active(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_NotStarted value)? notStarted,
    TResult Function(_Pending value)? pending,
    TResult Function(_Active value)? active,
    TResult Function(_Error value)? error,
  }) {
    return active?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NotStarted value)? notStarted,
    TResult Function(_Pending value)? pending,
    TResult Function(_Active value)? active,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (active != null) {
      return active(this);
    }
    return orElse();
  }
}

abstract class _Active implements AdRemovalPurchaseState {
  factory _Active() = _$_Active;
}

/// @nodoc
abstract class _$$_ErrorCopyWith<$Res> {
  factory _$$_ErrorCopyWith(_$_Error value, $Res Function(_$_Error) then) =
      __$$_ErrorCopyWithImpl<$Res>;
  $Res call({Object error});
}

/// @nodoc
class __$$_ErrorCopyWithImpl<$Res>
    extends _$AdRemovalPurchaseStateCopyWithImpl<$Res>
    implements _$$_ErrorCopyWith<$Res> {
  __$$_ErrorCopyWithImpl(_$_Error _value, $Res Function(_$_Error) _then)
      : super(_value, (v) => _then(v as _$_Error));

  @override
  _$_Error get _value => super._value as _$_Error;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$_Error(
      error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Object,
    ));
  }
}

/// @nodoc

class _$_Error with DiagnosticableTreeMixin implements _Error {
  _$_Error(this.error);

  @override
  final Object error;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AdRemovalPurchaseState.error(error: $error)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AdRemovalPurchaseState.error'))
      ..add(DiagnosticsProperty('error', error));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Error &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  _$$_ErrorCopyWith<_$_Error> get copyWith =>
      __$$_ErrorCopyWithImpl<_$_Error>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notStarted,
    required TResult Function() pending,
    required TResult Function() active,
    required TResult Function(Object error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? notStarted,
    TResult Function()? pending,
    TResult Function()? active,
    TResult Function(Object error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notStarted,
    TResult Function()? pending,
    TResult Function()? active,
    TResult Function(Object error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NotStarted value) notStarted,
    required TResult Function(_Pending value) pending,
    required TResult Function(_Active value) active,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_NotStarted value)? notStarted,
    TResult Function(_Pending value)? pending,
    TResult Function(_Active value)? active,
    TResult Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NotStarted value)? notStarted,
    TResult Function(_Pending value)? pending,
    TResult Function(_Active value)? active,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements AdRemovalPurchaseState {
  factory _Error(final Object error) = _$_Error;

  Object get error;
  @JsonKey(ignore: true)
  _$$_ErrorCopyWith<_$_Error> get copyWith =>
      throw _privateConstructorUsedError;
}
