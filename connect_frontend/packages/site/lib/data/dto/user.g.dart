// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      id: json['_id'] as String,
      username: json['username'] as String,
      displayUsername: json['displayUsername'] as String,
      name: json['name'] as String,
      profileImageUrl: json['profileImageUrl'] as String?,
      backgroundImageUrl: json['backgroundImageUrl'] as String?,
      geotag: json['geotag'] == null
          ? null
          : Geotag.fromJson(json['geotag'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      '_id': instance.id,
      'username': instance.username,
      'displayUsername': instance.displayUsername,
      'name': instance.name,
      'profileImageUrl': instance.profileImageUrl,
      'backgroundImageUrl': instance.backgroundImageUrl,
      'geotag': instance.geotag,
    };
