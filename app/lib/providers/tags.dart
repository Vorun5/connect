import 'package:app/data/api/api_services.dart';
import 'package:app/data/dto/tag.dart';
import 'package:app/providers/search_tags_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tags.g.dart';

@riverpod
class Tags extends _$Tags {
  @override
  Future<List<Tag>?> build() => _getTags(ref.watch(searchTagsProvider));

  Future<void> search(String search) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _getTags(search));
  }

  Future<List<Tag>> _getTags(String search) => ApiServices.searchTags(search);
}
