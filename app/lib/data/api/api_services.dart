import 'package:app/data/api/api_constants.dart';
import 'package:app/data/dto/event.dart';
import 'package:app/data/dto/event_preview.dart';
import 'package:app/data/dto/event_to_create.dart';
import 'package:app/data/dto/tag.dart';
import 'package:app/data/dto/user.dart';
import 'package:app/data/dto/user_to_login.dart';
import 'package:app/data/dto/user_to_sign_up.dart';
import 'package:app/data/dto/user_to_update.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tuple/tuple.dart';

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

    final data = eventToCreate.toJson()
      ..removeWhere((key, value) => value == null);

    try {
      final response = await _dio.post(url, data: data);

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

  static Future<int> removeEvent(String eventId) async {
    final storage = await SharedPreferences.getInstance();
    final token = storage.getString('token');
    _dio.options.headers['authorization'] = token;
    final url = ApiConstants.baseUrl + ApiConstants.getEventById(eventId);

    try {
      final response = await _dio.post(url, data: null);

      return response.statusCode ?? 500;
    } on DioError catch (e) {
      final response = e.response;
      if (response != null) {
        if (kDebugMode) {
          print(response.data);
        }
      }

      return 500;
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

  static Future<List<EventPreview>> getAllEvents() async {
    final storage = await SharedPreferences.getInstance();
    final token = storage.getString('token');
    _dio.options.headers['authorization'] = token;
    const url = ApiConstants.baseUrl + ApiConstants.getAllEvents;
    try {
      final response = await _dio.get(url);
      final data = response.data as List;
      final events = data
          .map(
            (jsonEvent) =>
                EventPreview.fromJson(jsonEvent as Map<String, dynamic>),
          )
          .toList();

      return events;
    } on DioError {
      return [];
    }
  }

  static Future<List<Tag>> searchTags(String str) async {
    final storage = await SharedPreferences.getInstance();
    final token = storage.getString('token');
    _dio.options.headers['authorization'] = token;
    final url = ApiConstants.baseUrl + ApiConstants.searchTags(str);
    try {
      final response = await _dio.get(url);
      final data = response.data as List;
      final tags = data
          .map((jsonEvent) => Tag.fromJson(jsonEvent as Map<String, dynamic>))
          .toList();

      return tags;
    } on DioError {
      return [];
    }
  }

  static Future<List<EventPreview>> searchEvents(String str) async {
    final storage = await SharedPreferences.getInstance();
    final token = storage.getString('token');
    _dio.options.headers['authorization'] = token;
    final url = ApiConstants.baseUrl + ApiConstants.searchEvents(str);
    try {
      final response = await _dio.get(url);
      final data = response.data as List;
      print(data);
      final events = data
          .map(
            (jsonEvent) =>
                EventPreview.fromJson(jsonEvent as Map<String, dynamic>),
          )
          .toList();

      return events;
    } on DioError {
      return [];
    }
  }

  static Future<Tag?> createTag(String name) async {
    final storage = await SharedPreferences.getInstance();
    final token = storage.getString('token');
    _dio.options.headers['authorization'] = token;
    const url = ApiConstants.baseUrl + ApiConstants.createTag;
    try {
      final response = await _dio.post(url, data: {'name': name});

      return Tag.fromJson(response.data as Map<String, dynamic>);
    } on DioError {
      return null;
    }
  }

  // 202 - попал в список ожидания
  // 200 - вступил в мероприятие
  // 400 - уже участник мероприятия
  // 404 - мероприятие не найдено
  static Future<int> joinToEvent(String eventId) async {
    final storage = await SharedPreferences.getInstance();
    final token = storage.getString('token');
    _dio.options.headers['authorization'] = token;
    final url = ApiConstants.baseUrl + ApiConstants.joinToEvent(eventId);
    try {
      final response = await _dio.post(url, data: null);

      return response.statusCode ?? 500;
    } on DioError catch (e) {
      final response = e.response;
      if (response != null) {
        if (kDebugMode) {
          return response.statusCode ?? 500;
        }
      }
      return serverErrorStatus;
    }
  }

  // 200 - вступил в мероприятие
  // 403 - нет доступа
  // 404 - мероприятие не найдено
  static Future<int> removeUsersFromEvents(
    String eventId,
    List<String> usersId,
  ) async {
    final storage = await SharedPreferences.getInstance();
    final token = storage.getString('token');
    _dio.options.headers['authorization'] = token;
    const url = ApiConstants.baseUrl + ApiConstants.removeUsersFromEvent;
    try {
      final response = await _dio.post(url, data: {
        'id': eventId,
        'users': usersId,
      });

      return response.statusCode ?? 500;
    } on DioError catch (e) {
      final response = e.response;
      if (response != null) {
        if (kDebugMode) {
          return response.statusCode ?? 500;
        }
      }
      return serverErrorStatus;
    }
  }

  static Future<Tuple2<Event?, int?>> getEventById(String eventId) async {
    final storage = await SharedPreferences.getInstance();
    final token = storage.getString('token');
    _dio.options.headers['authorization'] = token;
    final url = ApiConstants.baseUrl + ApiConstants.getEventById(eventId);
    try {
      final response = await _dio.get(url);
      print(response.data);

      return Tuple2(
          Event.fromJson(response.data as Map<String, dynamic>), null);
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
