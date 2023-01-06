// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_to_create.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EventToCreate _$$_EventToCreateFromJson(Map<String, dynamic> json) =>
    _$_EventToCreate(
      name: json['name'] as String,
      description: json['description'] as String?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      tags: (json['tags'] as List<dynamic>?)
          ?.map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_EventToCreateToJson(_$_EventToCreate instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'date': instance.date?.toIso8601String(),
      'tags': instance.tags,
    };
