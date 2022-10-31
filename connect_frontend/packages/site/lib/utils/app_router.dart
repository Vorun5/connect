import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:site/pages/home.dart';
import 'package:site/pages/login.dart';
import 'package:site/pages/sing_up.dart';
import 'package:site/pages/user_profile.dart';
import 'package:site/providers/auth_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
        builder: (context, state) => const Login(),
      ),
      GoRoute(
        path: '/sing-up',
        name: 'sing-up',
        builder: (context, state) => const SingUp(),
      ),
      GoRoute(
        path: '/',
        name: 'home',
        builder: (context, state) => const Home(),
        routes: [
          GoRoute(
            path: 'u/:username',
            name: 'user',
            builder: (context, state) => const UserProfile(),
          ),
        ],
      ),
    ],
    redirect: (context, state) {
      final areWeLoggingIn = state.location == '/login';
      final areWeSingUp = state.location == '/sing-up';

      if (!isAuth && areWeSingUp) return null;

      if (!isAuth) return areWeLoggingIn ? null : '/login';

      if (areWeLoggingIn || areWeSingUp) return '/';

      return null;
    },
  );
});

// class AppRouter {
//   static final router = GoRouter(
//       routerNeglect: true,
//       debugLogDiagnostics: true,
//       routes: [
//         GoRoute(
//           path: '/login',
//           name: 'login',
//           builder: (context, state) => const Login(),
//         ),
//         GoRoute(
//           path: '/sing-up',
//           name: 'sing-up',
//           builder: (context, state) => const SingUp(),
//         ),
//         GoRoute(
//           path: '/',
//           name: 'home',
//           builder: (context, state) => const Home(),
//           routes: [
//             GoRoute(
//               path: 'u/:username',
//               name: 'user',
//               builder: (context, state) => const UserProfile(),
//             ),
//           ],
//         ),
//       ],
//       redirect: (context, state) {
//         // If our async state is loading, don't perform redirects, yet
//         if (authNotifier.isLoading) return null;

//         final isAuth = authNotifier.isAuthenticated;

//         final isSplash = state.location == SplashPage.routeLocation;
//         if (isSplash) {
//           return isAuth ? HomePage.routeLocation : LoginPage.routeLocation;
//         }

//         final isLoggingIn = state.location == LoginPage.routeLocation;
//         if (isLoggingIn) return isAuth ? HomePage.routeLocation : null;

//         return isAuth ? null : SplashPage.routeLocation;
//       });
// }
