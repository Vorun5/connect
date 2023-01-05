// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TeamMessage _$$_TeamMessageFromJson(Map<String, dynamic> json) =>
    _$_TeamMessage(
      userId: json['userId'] as String,
      teamId: json['teamId'] as String,
      text: json['text'] as String,
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$$_TeamMessageToJson(_$_TeamMessage instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'teamId': instance.teamId,
      'text': instance.text,
      'date': instance.date.toIso8601String(),
    };
