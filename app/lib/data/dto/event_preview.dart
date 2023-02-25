import 'package:app/data/dto/tag.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'event_preview.freezed.dart';
part 'event_preview.g.dart';

@freezed
class EventPreview with _$EventPreview {
  factory EventPreview({
    @JsonKey(name: '_id') required String id,
    required String name,
    required String? imageUrl,
    required String? description,
    required DateTime? date,
    required int userCount,
    required List<Tag> tags,
    required bool entryAfterAdminApproval,
  }) = _EventPreview;

  factory EventPreview.fromJson(Map<String, dynamic> json) =>
      _$EventPreviewFromJson(json);
}
