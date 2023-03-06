import 'package:app/data/api/api_services.dart';
import 'package:app/data/dto/event_statistic_item.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'event_statistic.g.dart';

@riverpod
class EventStatistic extends _$EventStatistic {
  @override
  Future<List<EventStatisticItem>> build() => ApiServices.getEventStatistic();

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => ApiServices.getEventStatistic());
  }
}
