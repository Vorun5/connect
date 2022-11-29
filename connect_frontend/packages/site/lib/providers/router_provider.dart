import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:site/pages/edit_profile_page/edit_profile_page.dart';
import 'package:site/pages/home_page/home_page.dart';
import 'package:site/pages/login_page/login_page.dart';
import 'package:site/pages/sign_up_page/sign_up_page.dart';
import 'package:site/pages/user_profile_page/user_profile_page.dart';
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
        builder: (_, state) => const LoginPage(),
      ),
      GoRoute(
        path: '/sing-up',
        name: 'sing-up',
        builder: (_, state) => const SignUpPage(),
      ),
      GoRoute(
        path: '/',
        name: 'home',
        builder: (_, state) => const HomePage(),
        routes: [
          GoRoute(
            path: 'edit',
            name: 'edit',
            builder: (_, state) => const EditProfilePage(),
          ),
          GoRoute(
            path: 'u/:username',
            name: 'user-profile',
            builder: (_, state) {
              Future(() {
                ref.read(selectedUserProfileProvider.notifier).state =
                    state.params['username'];
              });

              return const UserProfilePage();
            },
          ),
        ],
      ),
    ],
    redirect: (context, state) {
      final areWeLoggingIn = state.location == '/login';
      final areWeSingUp = state.location == '/sing-up';

      if (isAuth != null) {
        if (!isAuth && areWeSingUp) {
          return null;
        }

        if (!isAuth) {
          return areWeLoggingIn ? null : '/login';
        }

        if (areWeLoggingIn || areWeSingUp) {
          return '/';
        }
      }

      return null;
    },
  );
});
