// TODO: стоит ли создавать для каждого события свою модель?
// или лучше сделать просто User с nullble полями?
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_to_sing_up.freezed.dart';
part 'user_to_sing_up.g.dart';

@freezed
class UserToSingUp with _$UserToSingUp {
  factory UserToSingUp({
    required String username,
    required String userDisplayName,
    required String password,
    required String name,
  }) = _UserToSingUp;

  factory UserToSingUp.fromJson(Map<String, dynamic> json) =>
      _$UserToSingUpFromJson(json);
}
