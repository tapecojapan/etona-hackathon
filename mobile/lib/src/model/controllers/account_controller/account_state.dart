import 'package:etona/src/model/model.dart';
import 'package:etona/src/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_state.freezed.dart';

@freezed
class AccountState with _$AccountState {
  factory AccountState({
    User? user,
    Account? account,
    @Default(LoadingType.loading) LoadingType isLoading,
  }) = _AccountState;

  AccountState._();
}
