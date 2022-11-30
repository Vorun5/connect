// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_to_update.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserToUpdate _$$_UserToUpdateFromJson(Map<String, dynamic> json) =>
    _$_UserToUpdate(
      id: json['_id'] as String?,
      username: json['username'] as String,
      name: json['name'] as String,
      profileImageUrl: json['profileImageUrl'] as String?,
      backgroundImageUrl: json['backgroundImageUrl'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$_UserToUpdateToJson(_$_UserToUpdate instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'username': instance.username,
      'name': instance.name,
      'profileImageUrl': instance.profileImageUrl,
      'backgroundImageUrl': instance.backgroundImageUrl,
      'description': instance.description,
    };
