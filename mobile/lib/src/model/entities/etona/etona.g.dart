// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'etona.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Etona _$$_EtonaFromJson(Map<String, dynamic> json) => _$_Etona(
      id: json['id'] as String,
      docId: json['docId'] as String?,
      photoURL: json['photoURL'] as String?,
      name: json['name'] as String?,
      godparentId: json['godparentId'] as String?,
      order: json['order'] as int?,
      type: json['type'] as int?,
    );

Map<String, dynamic> _$$_EtonaToJson(_$_Etona instance) => <String, dynamic>{
      'id': instance.id,
      'docId': instance.docId,
      'photoURL': instance.photoURL,
      'name': instance.name,
      'godparentId': instance.godparentId,
      'order': instance.order,
      'type': instance.type,
    };
