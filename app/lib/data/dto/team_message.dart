import 'package:freezed_annotation/freezed_annotation.dart';

part 'team_message.freezed.dart';
part 'team_message.g.dart';

@freezed
class TeamMessage with _$TeamMessage {
  factory TeamMessage({
    required int userId,
    required int teamId,
    required String text,
    required DateTime date,
  }) = _TeamMessage;

  factory TeamMessage.fromJson(Map<String, dynamic> json) =>
      _$TeamMessageFromJson(json);
}
