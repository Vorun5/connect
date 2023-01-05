import 'package:app/i18n/strings.g.dart';
import 'package:app/widgets/app_scaffold.dart';
import 'package:app/widgets/user_drawer.dart';
import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:go_router/go_router.dart';

part 'home_page.g.dart';

@swidget
Widget _homePage(BuildContext context) {
  final i18n = Translations.of(context);

  return AppScaffold(
    drawer: const UserDrawer(),
    appBar: AppBar(
      title: Text(i18n.screenTitles.allEvents),
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
  );
}
