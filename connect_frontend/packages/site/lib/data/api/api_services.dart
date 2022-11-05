import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:site/data/api/api_constants.dart';
import 'package:site/data/dto/user.dart';
import 'package:site/data/dto/user_to_login.dart';
import 'package:site/data/dto/user_to_sign_up.dart';
import 'package:tuple/tuple.dart';

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

  static Future<Tuple2<String?, int?>> login(UserToLogin user) async {
    const url = ApiConstants.baseUrl + ApiConstants.login;
    try {
      final res = await _dio.post(url, data: user.toJson());

      return Tuple2(res.data as String, null);
    } on DioError catch (e) {
      final res = e.response;
      if (res != null) {
        if (kDebugMode) {
          return Tuple2(null, res.statusCode);
        }
      }

      return const Tuple2(null, 500);
    }
  }

  static Future<Tuple2<String?, int?>> signUp(UserToSignUp user) async {
    const url = ApiConstants.baseUrl + ApiConstants.singUp;
    try {
      final res = await _dio.post(url, data: user.toJson());

      return Tuple2(res.data as String, null);
    } on DioError catch (e) {
      final res = e.response;
      if (res != null) {
        if (kDebugMode) {
          return Tuple2(null, res.statusCode);
        }
      }

      return const Tuple2(null, 500);
    }
  }
}
