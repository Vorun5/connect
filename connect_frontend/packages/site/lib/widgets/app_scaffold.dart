import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';

part 'app_scaffold.g.dart';

@swidget
Widget _appScaffold({
  required Widget body,
  PreferredSizeWidget? appBar,
  Widget? drawer,
}) =>
    ThemeSwitchingArea(
      child: SafeArea(
        child: Scaffold(
          appBar: appBar,
          drawer: drawer,
          body: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 800,
              ),
              child: body,
            ),
          ),
        ),
      ),
    );
