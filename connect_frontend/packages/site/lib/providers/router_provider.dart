import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:site/pages/edit_profile.dart';
import 'package:site/pages/home.dart';
import 'package:site/pages/login.dart';
import 'package:site/pages/sign_up.dart';
import 'package:site/pages/user_profile.dart';
import 'package:site/providers/auth_provider.dart';
import 'package:site/providers/selected_user_profile_provider.dart';

final navigatorKey = GlobalKey<NavigatorState>();

final routerProvider = Provider<GoRouter>((ref) {
  final isAuth = ref.watch(authProvider);

  return GoRouter(
    navigatorKey: navigatorKey,
    routerNeglect: true,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (_, state) => const Login(),
      ),
      GoRoute(
        path: '/sing-up',
        name: 'sing-up',
        builder: (_, state) => const SignUp(),
      ),
      GoRoute(
        path: '/',
        name: 'home',
        builder: (_, state) => const Home(),
        routes: [
          GoRoute(
            path: 'u',
            name: 'current-user-profile',
            builder: (_, state) => const EditProfile(),
          ),
          GoRoute(
            path: 'u/:username',
            name: 'user',
            builder: (_, state) {
              ref.read(selectedUserProfileProvider.notifier).state =
                  state.params['username'];

              return const UserProfile();
            },
          ),
        ],
      ),
    ],
    redirect: (context, state) {
      final areWeLoggingIn = state.location == '/login';
      final areWeSingUp = state.location == '/sing-up';

      if (!isAuth && areWeSingUp) {
        return null;
      }

      if (!isAuth) {
        return areWeLoggingIn ? null : '/login';
      }

      if (areWeLoggingIn || areWeSingUp) {
        return '/';
      }

      return null;
    },
  );
});
