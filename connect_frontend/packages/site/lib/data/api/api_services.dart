import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:site/data/api/api_constants.dart';
import 'package:site/data/dto/user.dart';
import 'package:site/data/dto/user_to_login.dart';
import 'package:site/data/dto/user_to_sign_up.dart';
import 'package:site/data/dto/user_to_update.dart';
import 'package:tuple/tuple.dart';

// final tokenProvider = FutureProvider(() {

// });

// final apiProvider = Provider(() {
//   // TODO: тут вотчить токен провайдер
// })

class ApiServices {
  static final _dio = Dio();
  static const serverErrorStatus = 500;

  // 200, 404, 500
  static Future<Tuple2<User?, int?>> getUser(String username) async {
    final storage = await SharedPreferences.getInstance();
    final token = storage.getString('token');
    _dio.options.headers['authorization'] = token;

    final url = ApiConstants.baseUrl + ApiConstants.userByUsername(username);
    try {
      final res = await _dio.get(url);
      final user = User.fromJson(res.data as Map<String, dynamic>);

      return Tuple2(user, null);
    } on DioError catch (e) {
      final res = e.response;
      if (res != null) {
        if (kDebugMode) {
          return Tuple2(null, res.statusCode);
        }
      }

      return const Tuple2(null, serverErrorStatus);
    }
  }

  static Future<User?> getMe() async {
    final storage = await SharedPreferences.getInstance();
    final token = storage.getString('token');
    _dio.options.headers['authorization'] = token;

    const url = ApiConstants.baseUrl + ApiConstants.usersEndpoint;
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

  // 200, 403, 500
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

      return const Tuple2(null, serverErrorStatus);
    }
  }

  // 200, 403, 500
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

      return const Tuple2(null, serverErrorStatus);
    }
  }

  // 200, 403, 404, 500
  static Future<int?> updateUserInformation(UserToUpdate user) async {
    final storage = await SharedPreferences.getInstance();
    final token = storage.getString('token');
    _dio.options.headers['authorization'] = token;
    const url = ApiConstants.baseUrl + ApiConstants.usersEndpoint;

    final data = user.toJson()..removeWhere((key, value) => value == null);

    try {
      final res = await _dio.patch(url, data: data);

      //return Tuple2(User.fromJson(res.data as Map<String, dynamic>), null);
      return null;
    } on DioError catch (e) {
      final res = e.response;
      if (res != null) {
        if (kDebugMode) {
          //return Tuple2(null, res.statusCode);
          return res.statusCode;
        }
      }

      //return const Tuple2(null, 500);
      return serverErrorStatus;
    }
  }

  //падает
  static Future<String?> uploadImage(FilePickerResult? result) async {
    final file = result?.files.first;
    const url = ApiConstants.baseUrl + ApiConstants.uploadImageEndpoint;

    if (file != null) {
      try {
        final formData = FormData.fromMap({
          'image': MultipartFile.fromBytes(
            file.bytes ?? [],
            filename: file.name,
            //contentType,: MediaType(),
          ),
        });
        final res = await _dio.post(
          url,
          data: formData,
        ) as Map<String, dynamic>;

        return res['url'] as String;
      } catch (_) {
        return null;
      }
    }

    return null;
  }
}
