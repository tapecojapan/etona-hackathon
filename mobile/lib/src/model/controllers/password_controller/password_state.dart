import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'password_state.freezed.dart';

@freezed
class PasswordState with _$PasswordState {
  factory PasswordState({
    String? password,
  }) = _PasswordState;

  PasswordState._();
}
