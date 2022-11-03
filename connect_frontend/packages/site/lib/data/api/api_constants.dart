class ApiConstants {
  static const String baseUrl = 'http://localhost:4040';
  static const String userEndpoint = '/user';
  static String userByLogin(String login) => '/user/$login';
  static const String login = '/auth/login';
  static const String singUp = '/auth/sing-up';
}
