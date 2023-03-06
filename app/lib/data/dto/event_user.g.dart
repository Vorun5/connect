// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EventUser _$$_EventUserFromJson(Map<String, dynamic> json) => _$_EventUser(
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$$_EventUserToJson(_$_EventUser instance) =>
    <String, dynamic>{
      'user': instance.user,
      'date': instance.date.toIso8601String(),
    };
