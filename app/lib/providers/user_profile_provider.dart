import 'package:app/data/api/api_services.dart';
import 'package:app/data/dto/user.dart';
import 'package:app/providers/selected_user_profile_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tuple/tuple.dart';

final userProfileProvider = FutureProvider<Tuple2<User?, int?>>((ref) async {
  final username = ref.watch(selectedUserProfileProvider);

  if (username == null) {
    return const Tuple2(null, 404);
  }

  return ApiServices.getUser(username);
});
