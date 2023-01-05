import 'package:freezed_annotation/freezed_annotation.dart';

part 'event_to_create.freezed.dart';
part 'event_to_create.g.dart';

@freezed
class EventToCreate with _$EventToCreate {
  factory EventToCreate({
    required String name,
    required String? description,
    required DateTime? date,
    required List<String>? tags,
  }) = _EventToCreate;

  factory EventToCreate.fromJson(Map<String, dynamic> json) =>
      _$EventToCreateFromJson(json);
}
