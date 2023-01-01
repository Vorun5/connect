import 'package:freezed_annotation/freezed_annotation.dart';

part 'event_user.freezed.dart';
part 'event_user.g.dart';

@freezed
class EventUser with _$EventUser {
  factory EventUser({
    required int id,
    required DateTime date,
    required DateTime lastTimeInChat,
  }) = _EventUser;

  factory EventUser.fromJson(Map<String, dynamic> json) =>
      _$EventUserFromJson(json);
}
