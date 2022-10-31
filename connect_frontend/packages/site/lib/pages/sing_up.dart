import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:site/providers/auth_provider.dart';

part 'sing_up.g.dart';

@hcwidget
Widget _singUp(BuildContext context, WidgetRef ref) => ThemeSwitchingArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () async {
                await ref.read(authProvider.notifier).login(
                      'myEmail',
                      'myPassword',
                    );
              },
              icon: const Icon(Icons.login),
            ),
          ],
          title: const Text(
            'Sing up',
          ),
        ),
        body: Center(
          child: Column(
            children: [
              TextButton(
                onPressed: () => context.goNamed('home'),
                child: const Text('Home'),
              ),
              TextButton(
                onPressed: () => context.goNamed('login'),
                child: const Text('Login'),
              ),
              TextButton(
                onPressed: () => context.goNamed('sing-up'),
                child: const Text('Sing Up'),
              ),
            ],
          ),
        ),
      ),
    );
