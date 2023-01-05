// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EventUser _$$_EventUserFromJson(Map<String, dynamic> json) => _$_EventUser(
      id: json['id'] as String,
      date: DateTime.parse(json['date'] as String),
      lastTimeInChat: DateTime.parse(json['lastTimeInChat'] as String),
    );

Map<String, dynamic> _$$_EventUserToJson(_$_EventUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date.toIso8601String(),
      'lastTimeInChat': instance.lastTimeInChat.toIso8601String(),
    };
