import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:site/data/api/api_services.dart';
import 'package:site/data/dto/user.dart';
import 'package:site/providers/selected_user_profile_provider.dart';
import 'package:tuple/tuple.dart';

final userProfileProvider = FutureProvider<Tuple2<User?, int?>>((ref) async {
  final username = ref.watch(selectedUserProfileProvider);

  if (username == null) {
    return const Tuple2(null, 404);
  }

  return ApiServices.getUser(username);
});
