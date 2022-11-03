import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:site/data/api/api_services.dart';
import 'package:site/data/dto/user_to_login.dart';

// ignore: prefer-match-file-name
class AuthNotifier extends StateNotifier<bool> {
  AuthNotifier() : super(false);

  Future<void> checkLocalToken() async {
    final user = await ApiServices.getMe();
    state = user != null;
  }

  Future<void> login(UserToLogin user) async {
    final token = await ApiServices.login(user);
    state = token != null;
  }

  Future<void> logout() async {
    final storage = await SharedPreferences.getInstance();
    final res = await storage.remove('token');
    state = !res;
  }
}

final authProvider =
    StateNotifierProvider<AuthNotifier, bool>((ref) => AuthNotifier());
