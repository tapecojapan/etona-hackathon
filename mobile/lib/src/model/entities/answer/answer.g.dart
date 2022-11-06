// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Answer _$$_AnswerFromJson(Map<String, dynamic> json) => _$_Answer(
      id: json['id'] as String?,
      etonaId: json['etonaId'] as String?,
      playerId: json['playerId'] as String?,
      tapMilliseconds: json['tapMilliseconds'] as int?,
      imageAnswer: json['imageAnswer'] as String?,
      nameAnswer: json['nameAnswer'] as String?,
      createdAt: const CreatedAtField().fromJson(json['createdAt']),
    );

Map<String, dynamic> _$$_AnswerToJson(_$_Answer instance) => <String, dynamic>{
      'id': instance.id,
      'etonaId': instance.etonaId,
      'playerId': instance.playerId,
      'tapMilliseconds': instance.tapMilliseconds,
      'imageAnswer': instance.imageAnswer,
      'nameAnswer': instance.nameAnswer,
      'createdAt': const CreatedAtField().toJson(instance.createdAt),
    };
