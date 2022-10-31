import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final tokenProvider = FutureProvider<String?>((_) async {
  final storage = await SharedPreferences.getInstance();
  final token = storage.getString('token');

  return token != null ? token : 'none';
});
