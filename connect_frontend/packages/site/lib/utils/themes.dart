import 'package:flutter/material.dart';

class Themes {
  static final ThemeData dark =
      ThemeData.dark().copyWith(appBarTheme: const AppBarTheme(elevation: 0));
  static final ThemeData ligth =
      ThemeData.light().copyWith(appBarTheme: const AppBarTheme(elevation: 0));
}
