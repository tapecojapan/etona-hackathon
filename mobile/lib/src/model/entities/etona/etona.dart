import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'etona.freezed.dart';
part 'etona.g.dart';

@freezed
class Etona with _$Etona {
  factory Etona({
    required String id,
    String? docId,
    String? photoURL,
    String? name,
    String? godparentId,
    int? order,
    int? type,
  }) = _Etona;

  factory Etona.fromJson(Map<String, dynamic> json) => _$EtonaFromJson(json);

  factory Etona.empty() => Etona(id: '');
}
