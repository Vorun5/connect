import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:site/data/dto/geotag.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  factory User({
    required String username,
    required String displayUsername,
    required String name,
    required String id,
    required String? profileImageUrl,
    required String? backgroundImageUrl,
    required Geotag? geotag,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
