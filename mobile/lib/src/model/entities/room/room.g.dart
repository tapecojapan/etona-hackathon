// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Room _$$_RoomFromJson(Map<String, dynamic> json) => _$_Room(
      id: json['id'] as String?,
      hostId: json['hostId'] as String?,
      password: json['password'] as String?,
      playerIds: (json['playerIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      createdAt: const CreatedAtField().fromJson(json['createdAt']),
    );

Map<String, dynamic> _$$_RoomToJson(_$_Room instance) => <String, dynamic>{
      'id': instance.id,
      'hostId': instance.hostId,
      'password': instance.password,
      'playerIds': instance.playerIds,
      'createdAt': const CreatedAtField().toJson(instance.createdAt),
    };
