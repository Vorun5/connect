import 'package:flutter/material.dart';

class Themes {
  static final ThemeData darkTheme =
      ThemeData.dark().copyWith(appBarTheme: const AppBarTheme(elevation: 0));
  static final ThemeData ligthTheme =
      ThemeData.light().copyWith(appBarTheme: const AppBarTheme(elevation: 0));
}
