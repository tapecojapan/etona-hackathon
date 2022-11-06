// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'account_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AccountState {
  User? get user => throw _privateConstructorUsedError;
  Account? get account => throw _privateConstructorUsedError;
  LoadingType get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AccountStateCopyWith<AccountState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountStateCopyWith<$Res> {
  factory $AccountStateCopyWith(
          AccountState value, $Res Function(AccountState) then) =
      _$AccountStateCopyWithImpl<$Res>;
  $Res call({User? user, Account? account, LoadingType isLoading});

  $AccountCopyWith<$Res>? get account;
}

/// @nodoc
class _$AccountStateCopyWithImpl<$Res> implements $AccountStateCopyWith<$Res> {
  _$AccountStateCopyWithImpl(this._value, this._then);

  final AccountState _value;
  // ignore: unused_field
  final $Res Function(AccountState) _then;

  @override
  $Res call({
    Object? user = freezed,
    Object? account = freezed,
    Object? isLoading = freezed,
  }) {
    return _then(_value.copyWith(
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      account: account == freezed
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as Account?,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as LoadingType,
    ));
  }

  @override
  $AccountCopyWith<$Res>? get account {
    if (_value.account == null) {
      return null;
    }

    return $AccountCopyWith<$Res>(_value.account!, (value) {
      return _then(_value.copyWith(account: value));
    });
  }
}

/// @nodoc
abstract class _$$_AccountStateCopyWith<$Res>
    implements $AccountStateCopyWith<$Res> {
  factory _$$_AccountStateCopyWith(
          _$_AccountState value, $Res Function(_$_AccountState) then) =
      __$$_AccountStateCopyWithImpl<$Res>;
  @override
  $Res call({User? user, Account? account, LoadingType isLoading});

  @override
  $AccountCopyWith<$Res>? get account;
}

/// @nodoc
class __$$_AccountStateCopyWithImpl<$Res>
    extends _$AccountStateCopyWithImpl<$Res>
    implements _$$_AccountStateCopyWith<$Res> {
  __$$_AccountStateCopyWithImpl(
      _$_AccountState _value, $Res Function(_$_AccountState) _then)
      : super(_value, (v) => _then(v as _$_AccountState));

  @override
  _$_AccountState get _value => super._value as _$_AccountState;

  @override
  $Res call({
    Object? user = freezed,
    Object? account = freezed,
    Object? isLoading = freezed,
  }) {
    return _then(_$_AccountState(
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      account: account == freezed
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as Account?,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as LoadingType,
    ));
  }
}

/// @nodoc

class _$_AccountState extends _AccountState {
  _$_AccountState(
      {this.user, this.account, this.isLoading = LoadingType.loading})
      : super._();

  @override
  final User? user;
  @override
  final Account? account;
  @override
  @JsonKey()
  final LoadingType isLoading;

  @override
  String toString() {
    return 'AccountState(user: $user, account: $account, isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AccountState &&
            const DeepCollectionEquality().equals(other.user, user) &&
            const DeepCollectionEquality().equals(other.account, account) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(user),
      const DeepCollectionEquality().hash(account),
      const DeepCollectionEquality().hash(isLoading));

  @JsonKey(ignore: true)
  @override
  _$$_AccountStateCopyWith<_$_AccountState> get copyWith =>
      __$$_AccountStateCopyWithImpl<_$_AccountState>(this, _$identity);
}

abstract class _AccountState extends AccountState {
  factory _AccountState(
      {final User? user,
      final Account? account,
      final LoadingType isLoading}) = _$_AccountState;
  _AccountState._() : super._();

  @override
  User? get user;
  @override
  Account? get account;
  @override
  LoadingType get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$_AccountStateCopyWith<_$_AccountState> get copyWith =>
      throw _privateConstructorUsedError;
}
