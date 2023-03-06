import 'package:app/data/api/api_services.dart';
import 'package:app/data/dto/event_preview.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'top_events.g.dart';

@riverpod
class TopEvents extends _$TopEvents {
  @override
  Future<List<EventPreview>> build() => ApiServices.getTopEvents();

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => ApiServices.getTopEvents());
  }
}
