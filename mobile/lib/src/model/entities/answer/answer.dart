import 'package:etona/src/utils/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'answer.freezed.dart';
part 'answer.g.dart';

@freezed
class Answer with _$Answer {
  factory Answer({
    String? id,
    String? etonaId,
    String? playerId,
    int? tapMilliseconds,
    String? imageAnswer,
    String? nameAnswer,
    @CreatedAtField() DateTime? createdAt,
  }) = _Answer;

  factory Answer.fromJson(Map<String, dynamic> json) => _$AnswerFromJson(json);

  factory Answer.empty() => Answer();
}
