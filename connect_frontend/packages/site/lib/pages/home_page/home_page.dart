import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:site/widgets/app_scaffold.dart';
import 'package:site/widgets/user_drawer.dart';

part 'home_page.g.dart';

@swidget
Widget _homePage(BuildContext context) => AppScaffold(
      drawer: const UserDrawer(),
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
    );
