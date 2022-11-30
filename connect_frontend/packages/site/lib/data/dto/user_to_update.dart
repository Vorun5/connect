import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_to_update.freezed.dart';
part 'user_to_update.g.dart';

@freezed
class UserToUpdate with _$UserToUpdate {
  factory UserToUpdate({
    @JsonKey(name: '_id') required String? id,
    required String username,
    required String name,
    required String? profileImageUrl,
    required String? backgroundImageUrl,
    required String? description,
  }) = _UserToUpdate;

  factory UserToUpdate.fromJson(Map<String, dynamic> json) =>
      _$UserToUpdateFromJson(json);
}
