import 'package:app/data/api/api_services.dart';
import 'package:app/data/dto/event.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tuple/tuple.dart';

part 'selected_event.g.dart';

@riverpod
class SelectedEvent extends _$SelectedEvent {
  @override
  Future<Tuple2<Event?, int?>> build() => Future(
        () => const Tuple2(null, null),
      );

  Future<void> selectEvent(String eventId) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _getEvent(eventId));
  }

  Future<Tuple2<Event?, int?>> _getEvent(String eventId) =>
      ApiServices.getEventById(eventId);
}
