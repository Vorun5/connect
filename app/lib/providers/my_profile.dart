import 'package:app/data/api/api_services.dart';
import 'package:app/data/dto/user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'my_profile.g.dart';

@riverpod
class MyProfile extends _$MyProfile {
  @override
  Future<User?> build() => ApiServices.getMe();
}
