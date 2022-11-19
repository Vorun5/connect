import 'package:flutter/material.dart';

class Themes {
  static final ThemeData dark = ThemeData.dark().copyWith(
    useMaterial3: true,
    appBarTheme: const AppBarTheme(elevation: 0, centerTitle: true),
  );
  static final ThemeData light = ThemeData.light().copyWith(
    useMaterial3: true,
    appBarTheme: const AppBarTheme(elevation: 0, centerTitle: true),
  );
}
