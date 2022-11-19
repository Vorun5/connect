import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:site/providers/auth_provider.dart';
import 'package:site/providers/selected_user_profile_provider.dart';
import 'package:site/widgets/edit_profile_page/edit_profile.dart';
import 'package:site/widgets/home_page/home.dart';
import 'package:site/widgets/login_page/login.dart';
import 'package:site/widgets/sign_up_page/sign_up.dart';
import 'package:site/widgets/user_profile_page/user_profile.dart';

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
            path: 'edit',
            name: 'edit',
            builder: (_, state) => const EditProfile(),
          ),
          GoRoute(
            path: 'u/:username',
            name: 'user-profile',
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
