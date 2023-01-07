import 'package:app/data/api/api_services.dart';
import 'package:app/data/dto/event_preview.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'my_events.g.dart';

@riverpod
class MyEvents extends _$MyEvents {
  @override
  Future<List<EventPreview>> build() => ApiServices.getAllEvents();

  Future<void> addEvent(EventPreview event) async {
    state = const AsyncLoading();
    state =
        await AsyncValue.guard(() => Future(() => [...state.value!, event]));
  }
}
