import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_to_sign_up.freezed.dart';
part 'user_to_sign_up.g.dart';

@freezed
class UserToSignUp with _$UserToSignUp {
  factory UserToSignUp({
    required String username,
    required String password,
    required String name,
  }) = _UserToSignUp;

  factory UserToSignUp.fromJson(Map<String, dynamic> json) =>
      _$UserToSignUpFromJson(json);
}
