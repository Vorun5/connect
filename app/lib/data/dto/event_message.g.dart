// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EventMessage _$$_EventMessageFromJson(Map<String, dynamic> json) =>
    _$_EventMessage(
      userId: json['userId'] as String,
      eventId: json['eventId'] as String,
      text: json['text'] as String,
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$$_EventMessageToJson(_$_EventMessage instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'eventId': instance.eventId,
      'text': instance.text,
      'date': instance.date.toIso8601String(),
    };
