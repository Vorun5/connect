import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';

part 'screen_layout.g.dart';

@swidget
Widget _screenLayout({
  required Widget child,
}) =>
    ThemeSwitchingArea(
      child: SafeArea(
        child: child,
      ),
    );
