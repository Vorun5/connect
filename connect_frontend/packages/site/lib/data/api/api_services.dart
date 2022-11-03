import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:site/data/api/api_constants.dart';
import 'package:site/data/dto/user.dart';
import 'package:site/data/dto/user_to_login.dart';

class ApiServices {
  static final _dio = Dio();

  static Future<User?> getMe() async {
    final storage = await SharedPreferences.getInstance();
    final token = storage.getString('token');
    _dio.options.headers['authorization'] = token;

    const url = ApiConstants.baseUrl + ApiConstants.userEndpoint;
    try {
      final res = await _dio.get(url);

      return User.fromJson(res.data as Map<String, dynamic>);
    } on DioError catch (e) {
      final res = e.response;
      if (res != null) {
        if (kDebugMode) {
          print(res.data);
        }
      }

      return null;
    }
  }

  static Future<String?> login(UserToLogin user) async {
    const url = ApiConstants.baseUrl + ApiConstants.login;
    try {
      final res = await _dio.post(url, data: user.toJson());

      return res.data as String;
    } on DioError catch (e) {
      final res = e.response;
      if (res != null) {
        if (kDebugMode) {
          print(e.type);
          print(res.data);
        }
      }

      return null;
    }
  }
}
