// TODO: стоит ли создавать для каждого события свою модель?
// или лучше сделать просто User с nullble полями?
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_to_login.freezed.dart';
part 'user_to_login.g.dart';

@freezed
class UserToLogin with _$UserToLogin {
  factory UserToLogin({
    required String username,
    required String userDisplayName,
    required String password,
    required String name,
  }) = _UserToLogin;

  factory UserToLogin.fromJson(Map<String, dynamic> json) =>
      _$UserToLoginFromJson(json);
}
