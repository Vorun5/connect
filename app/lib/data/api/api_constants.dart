class ApiConstants {
  static const String baseUrl = 'http://localhost:4040';
  static const String usersEndpoint = '/users';
  static const String getAllEvents = '/get-all-user-events';
  static String getEventById(String eventId) => '/events/$eventId';
  static String userByUsername(String username) => '/users/$username';
  static String searchTags(String str) => '/tags/$str';
  static String searchEvents(String str) => '/events/search/$str';
  static const String createTag = '/tags';
  static const String login = '/auth/login';
  static const String singUp = '/auth/sing-up';
  static const String uploadImageEndpoint = '/upload/';
  static const String eventEndpoint = '/events';
}
