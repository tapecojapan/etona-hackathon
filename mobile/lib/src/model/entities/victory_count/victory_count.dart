import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'victory_count.freezed.dart';
part 'victory_count.g.dart';

@freezed
class VictoryCount with _$VictoryCount {
  factory VictoryCount({
    String? playerId,
    int? count,
  }) = _VictoryCount;

  factory VictoryCount.fromJson(Map<String, dynamic> json) =>
      _$VictoryCountFromJson(json);
}
