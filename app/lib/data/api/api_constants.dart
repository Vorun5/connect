class ApiConstants {
  static const String baseUrl = 'http://localhost:4040';
  static const String usersEndpoint = '/users';
  static String userByUsername(String username) => '/users/$username';
  static const String login = '/auth/login';
  static const String singUp = '/auth/sing-up';
  static const String uploadImageEndpoint = '/upload/';
}