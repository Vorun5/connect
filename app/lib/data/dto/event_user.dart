import 'package:app/data/dto/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'event_user.freezed.dart';
part 'event_user.g.dart';

@freezed
class EventUser with _$EventUser {
  factory EventUser({
    required User user,
    required DateTime date,
  }) = _EventUser;

  factory EventUser.fromJson(Map<String, dynamic> json) =>
      _$EventUserFromJson(json);
}
