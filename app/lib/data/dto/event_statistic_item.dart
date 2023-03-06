import 'package:freezed_annotation/freezed_annotation.dart';

part 'event_statistic_item.freezed.dart';
part 'event_statistic_item.g.dart';

@freezed
class EventStatisticItem with _$EventStatisticItem {
  factory EventStatisticItem({
    required bool entryAfterAdminApproval,
    required int count,
  }) = _EventStatisticItem;

  factory EventStatisticItem.fromJson(Map<String, dynamic> json) =>
      _$EventStatisticItemFromJson(json);
}
