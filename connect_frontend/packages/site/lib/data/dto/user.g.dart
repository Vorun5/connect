// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      username: json['username'] as String,
      userDisplayName: json['userDisplayName'] as String,
      name: json['name'] as String,
      id: json['id'] as String,
      profileImageUrl: json['profileImageUrl'] as String?,
      backgroundImageUrl: json['backgroundImageUrl'] as String?,
      geotag: json['geotag'] == null
          ? null
          : Geotag.fromJson(json['geotag'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'username': instance.username,
      'userDisplayName': instance.userDisplayName,
      'name': instance.name,
      'id': instance.id,
      'profileImageUrl': instance.profileImageUrl,
      'backgroundImageUrl': instance.backgroundImageUrl,
      'geotag': instance.geotag,
    };
