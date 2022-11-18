import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_model.freezed.dart';

@freezed
class AuthModel with _$AuthModel {
  factory AuthModel({
    required bool? isAuth,
    required SharedPreferences? storage,
  }) = _AuthModel;
}
