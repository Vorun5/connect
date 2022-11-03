import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_to_login.freezed.dart';
part 'user_to_login.g.dart';

@freezed
class UserToLogin with _$UserToLogin {
  factory UserToLogin({
    required String username,
    required String password,
  }) = _UserToLogin;

  factory UserToLogin.fromJson(Map<String, dynamic> json) =>
      _$UserToLoginFromJson(json);
}
