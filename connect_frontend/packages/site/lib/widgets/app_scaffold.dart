import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:site/providers/auth_provider.dart';

part 'app_scaffold.g.dart';

@hcwidget
Widget _appScaffold(
  BuildContext contex,
  WidgetRef ref, {
  required Widget body,
  PreferredSizeWidget? appBar,
  Widget? drawer,
}) {
  final isAuth = ref.watch(authProvider);

  return ThemeSwitchingArea(
    child: SafeArea(
      child: Scaffold(
        appBar: isAuth != null ? appBar : null,
        drawer: isAuth != null ? drawer : null,
        body: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: isAuth == null ? const CircularProgressIndicator() : body,
          ),
        ),
      ),
    ),
  );
}
