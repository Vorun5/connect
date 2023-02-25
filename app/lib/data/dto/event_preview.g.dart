// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_preview.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EventPreview _$$_EventPreviewFromJson(Map<String, dynamic> json) =>
    _$_EventPreview(
      id: json['_id'] as String,
      name: json['name'] as String,
      imageUrl: json['imageUrl'] as String?,
      description: json['description'] as String?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      userCount: json['userCount'] as int,
      tags: (json['tags'] as List<dynamic>)
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      entryAfterAdminApproval: json['entryAfterAdminApproval'] as bool,
    );

Map<String, dynamic> _$$_EventPreviewToJson(_$_EventPreview instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'description': instance.description,
      'date': instance.date?.toIso8601String(),
      'userCount': instance.userCount,
      'tags': instance.tags,
      'entryAfterAdminApproval': instance.entryAfterAdminApproval,
    };
