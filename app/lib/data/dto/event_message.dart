import 'package:freezed_annotation/freezed_annotation.dart';

part 'event_message.freezed.dart';
part 'event_message.g.dart';

@freezed
class EventMessage with _$EventMessage {
  factory EventMessage({
    required String userId,
    required String eventId,
    required String text,
    required DateTime date,
  }) = _EventMessage;

  factory EventMessage.fromJson(Map<String, dynamic> json) =>
      _$EventMessageFromJson(json);
}
