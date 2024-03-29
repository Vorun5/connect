import 'package:app/pages/edit_profile_page/edit_profile_page.dart';
import 'package:app/pages/event_page/event_page.dart';
import 'package:app/pages/home_page/home_page.dart';
import 'package:app/pages/login_page/login_page.dart';
import 'package:app/pages/sign_up_page/sign_up_page.dart';
import 'package:app/pages/user_profile_page/user_profile_page.dart';
import 'package:app/providers/auth_provider.dart';
import 'package:app/providers/my_events.dart';
import 'package:app/providers/selected_event.dart';
import 'package:app/providers/selected_user_profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
        builder: (_, state) {
          Future(() {
            ref.read(myEventsProvider.notifier).refresh();
          });
          return const HomePage();
        },
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
          GoRoute(
            path: 'e/:id',
            name: 'event',
            builder: (_, state) {
              Future(() => ref
                  .read(selectedEventProvider.notifier)
                  .selectEvent(state.params['id']!));

              return const EventPage();
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
