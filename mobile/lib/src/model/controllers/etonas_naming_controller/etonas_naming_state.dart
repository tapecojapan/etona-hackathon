import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:etona/src/model/model.dart';
import 'package:etona/src/utils/utils.dart';

part 'etonas_naming_state.freezed.dart';

@freezed
class EtonasNamingState with _$EtonasNamingState {
  factory EtonasNamingState({
    @Default(<Etona>[]) List<Etona> etonas,
    @Default(LoadingType.loading) LoadingType isLoading,
  }) = _EtonasNamingState;

  EtonasNamingState._();
}
