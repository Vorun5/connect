import 'package:flutter/material.dart';

class Themes {
  static final ThemeData dark = ThemeData.dark().copyWith(
    appBarTheme: const AppBarTheme(elevation: 0, centerTitle: true),
  );
  static final ThemeData light = ThemeData.light().copyWith(
    appBarTheme: const AppBarTheme(elevation: 0, centerTitle: true),
  );
}
