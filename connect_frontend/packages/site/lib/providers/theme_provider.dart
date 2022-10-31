import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

enum ThemeColors {
  dark,
  light,
  cyberpunk,
}

class ColorNotifier extends StateNotifier<ThemeColors> {
  ColorNotifier() : super(ThemeColors.cyberpunk);

  void toggleTheme(ThemeColors theme) {
    state = theme;
    print(state);
  }

  Color get primaryText {
    switch (state) {
      case ThemeColors.light:
        return Colors.black;
      case ThemeColors.dark:
        return Colors.white;
      case ThemeColors.cyberpunk:
        return Colors.yellow;
    }
  }

  Color get primaryBackground {
    switch (state) {
      case ThemeColors.light:
        return Colors.white;
      case ThemeColors.dark:
        return Colors.black;
      case ThemeColors.cyberpunk:
        return Colors.pink;
    }
  }
}

final colorsProvider = StateNotifierProvider<ColorNotifier, ThemeColors>(
  (_) => ColorNotifier(),
);
