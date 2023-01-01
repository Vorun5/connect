import 'package:app/data/api/api_constants.dart';
import 'package:app/data/dto/event.dart';
import 'package:app/data/dto/event_to_create.dart';
import 'package:app/data/dto/user.dart';
import 'package:app/data/dto/user_to_login.dart';
import 'package:app/data/dto/user_to_sign_up.dart';
import 'package:app/data/dto/user_to_update.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
      final response = await _dio.get(url);
      final user = User.fromJson(response.data as Map<String, dynamic>);

      return Tuple2(user, null);
    } on DioError catch (e) {
      final response = e.response;
      if (response != null) {
        if (kDebugMode) {
          return Tuple2(null, response.statusCode);
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
      final response = await _dio.get(url);

      return User.fromJson(response.data as Map<String, dynamic>);
    } on DioError catch (e) {
      final response = e.response;
      if (response != null) {
        if (kDebugMode) {
          print(response.data);
        }
      }

      return null;
    }
  }

  static Future<Event?> createEvent(EventToCreate eventToCreate) async {
    final storage = await SharedPreferences.getInstance();
    final token = storage.getString('token');
    _dio.options.headers['authorization'] = token;

    const url = ApiConstants.baseUrl + ApiConstants.eventEndpoint;
    try {
      final response = await _dio.post(url, data: eventToCreate.toJson());

      return Event.fromJson(response.data as Map<String, dynamic>);
    } on DioError catch (e) {
      final response = e.response;
      if (response != null) {
        if (kDebugMode) {
          print(response.data);
        }
      }

      return null;
    }
  }

  // 200, 403, 500
  static Future<Tuple2<String?, int?>> login(UserToLogin user) async {
    const url = ApiConstants.baseUrl + ApiConstants.login;
    try {
      final response = await _dio.post(url, data: user.toJson());

      return Tuple2(response.data as String, null);
    } on DioError catch (e) {
      final response = e.response;
      if (response != null) {
        if (kDebugMode) {
          return Tuple2(null, response.statusCode);
        }
      }

      return const Tuple2(null, serverErrorStatus);
    }
  }

  // 200, 403, 500
  static Future<Tuple2<String?, int?>> signUp(UserToSignUp user) async {
    const url = ApiConstants.baseUrl + ApiConstants.singUp;
    try {
      final response = await _dio.post(url, data: user.toJson());

      return Tuple2(response.data as String, null);
    } on DioError catch (e) {
      final response = e.response;
      if (response != null) {
        if (kDebugMode) {
          return Tuple2(null, response.statusCode);
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
      final response = await _dio.patch(url, data: data);

      //return Tuple2(User.fromJson(res.data as Map<String, dynamic>), null);
      return null;
    } on DioError catch (e) {
      final response = e.response;
      if (response != null) {
        if (kDebugMode) {
          //return Tuple2(null, res.statusCode);
          return response.statusCode;
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
        final response = await _dio.post(
          url,
          data: formData,
        ) as Map<String, dynamic>;

        return response['url'] as String;
      } catch (_) {
        return null;
      }
    }

    return null;
  }
}
