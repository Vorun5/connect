// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Event _$$_EventFromJson(Map<String, dynamic> json) => _$_Event(
      id: json['_id'] as String,
      idCreator: json['idCreator'] as String,
      name: json['name'] as String,
      imageUrl: json['imageUrl'] as String?,
      description: json['description'] as String?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      appearInSearch: json['appearInSearch'] as bool?,
      showAllMessage: json['showAllMessage'] as bool?,
      entryAfterAdminApproval: json['entryAfterAdminApproval'] as bool?,
      idPinnedMessages: (json['idPinnedMessages'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      usersWhoWantToJoin: (json['usersWhoWantToJoin'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      users: (json['users'] as List<dynamic>)
          .map((e) => EventUser.fromJson(e as Map<String, dynamic>))
          .toList(),
      teams: (json['teams'] as List<dynamic>).map((e) => e as String).toList(),
      tags: (json['tags'] as List<dynamic>)
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_EventToJson(_$_Event instance) => <String, dynamic>{
      '_id': instance.id,
      'idCreator': instance.idCreator,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'description': instance.description,
      'date': instance.date?.toIso8601String(),
      'appearInSearch': instance.appearInSearch,
      'showAllMessage': instance.showAllMessage,
      'entryAfterAdminApproval': instance.entryAfterAdminApproval,
      'idPinnedMessages': instance.idPinnedMessages,
      'usersWhoWantToJoin': instance.usersWhoWantToJoin,
      'users': instance.users,
      'teams': instance.teams,
      'tags': instance.tags,
    };
