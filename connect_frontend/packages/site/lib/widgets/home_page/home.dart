import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:site/utils/screen_layout.dart';
import 'package:site/widgets/drawer/drawer_with_user_settings.dart';

part 'home.g.dart';

@hcwidget
Widget _home(BuildContext context, WidgetRef ref) => ScreenLayout(
      child: Scaffold(
        drawer: const DrawerWithUserSettings(),
        appBar: AppBar(
          title: const Text('Home'),
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