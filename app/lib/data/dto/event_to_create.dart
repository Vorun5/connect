import 'package:app/data/dto/tag.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'event_to_create.freezed.dart';
part 'event_to_create.g.dart';

@freezed
class EventToCreate with _$EventToCreate {
  factory EventToCreate({
    required String name,
    required String? imageUrl,
    required String? description,
    required DateTime? date,
    required List<Tag>? tags,
    required bool entryAfterAdminApproval,
  }) = _EventToCreate;

  factory EventToCreate.fromJson(Map<String, dynamic> json) =>
      _$EventToCreateFromJson(json);
}
