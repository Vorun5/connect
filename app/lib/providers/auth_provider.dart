import 'package:app/data/api/api_services.dart';
import 'package:app/data/dto/user_to_login.dart';
import 'package:app/data/dto/user_to_sign_up.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthNotifier extends StateNotifier<bool?> {
  AuthNotifier() : super(null);

  Future<void> checkLocalToken() async {
    final user = await ApiServices.getMe();
    state = user != null;
  }

  Future<int?> login(UserToLogin user) async {
    final res = await ApiServices.login(user);
    final token = res.item1;
    if (token != null) {
      final storage = await SharedPreferences.getInstance();
      state = await storage.setString('token', token);
    }

    return res.item2;
  }

  Future<int?> signUp(UserToSignUp user) async {
    final res = await ApiServices.signUp(user);
    final token = res.item1;
    if (token != null) {
      final storage = await SharedPreferences.getInstance();
      state = await storage.setString('token', token);
    }

    return res.item2;
  }

  Future<void> logout() async {
    final storage = await SharedPreferences.getInstance();
    final res = await storage.remove('token');
    state = !res;
  }
}

final authProvider =
    StateNotifierProvider<AuthNotifier, bool?>((ref) => AuthNotifier());
