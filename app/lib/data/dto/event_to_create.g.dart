// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_to_create.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EventToCreate _$$_EventToCreateFromJson(Map<String, dynamic> json) =>
    _$_EventToCreate(
      name: json['name'] as String,
      imageUrl: json['imageUrl'] as String?,
      description: json['description'] as String?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      tags: (json['tags'] as List<dynamic>?)
          ?.map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      entryAfterAdminApproval: json['entryAfterAdminApproval'] as bool,
    );

Map<String, dynamic> _$$_EventToCreateToJson(_$_EventToCreate instance) =>
    <String, dynamic>{
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'description': instance.description,
      'date': instance.date?.toIso8601String(),
      'tags': instance.tags,
      'entryAfterAdminApproval': instance.entryAfterAdminApproval,
    };
