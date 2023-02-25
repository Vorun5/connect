import 'package:app/data/dto/event_user.dart';
import 'package:app/data/dto/tag.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'event.freezed.dart';
part 'event.g.dart';

@freezed
class Event with _$Event {
  factory Event({
    @JsonKey(name: '_id') required String id,
    required String idCreator,
    required String name,
    required int? unreadMessages,
    required String? imageUrl,
    required String? description,
    required DateTime? date,
    required bool appearInSearch,
    required bool showAllMessage,
    required bool entryAfterAdminApproval,
    required List<String> idPinnedMessages,
    required List<String> usersWhoWantToJoin,
    required List<EventUser> users,
    required List<Tag> tags,
  }) = _Event;

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);
}
