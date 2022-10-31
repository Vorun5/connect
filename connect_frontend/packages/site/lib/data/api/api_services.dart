import 'package:dio/dio.dart';

class ApiServices {
  static final _dio = Dio();

  // static Future<String> login(UserToLogin userToLogin) async {
  //   Response<ResponseBody> rs;

  //   const url = ApiConstants.baseUrl + ApiConstants.login;
  //   final res = await _dio.post<ResponseBody>(
  //     url,
  //     data: userToLogin.toJson(),
  //     onSendProgress: (sent, total) {
  //       print('$sent $total');
  //     },
  //   );

  // if (res.statusCode !== 200) {

  // }
  //   return '';
  // }
}
