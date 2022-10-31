import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

enum DisplayMode {
  mobile,
  tablet,
  desktop,
}

const _mobile = 600;
const _tablet = 1100;

class DisplayModeStateNotifier extends StateNotifier<DisplayMode>
    with WidgetsBindingObserver {
  DisplayModeStateNotifier() : super(DisplayMode.desktop) {
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeMetrics() {
    final displayWidth = WidgetsBinding.instance.window.physicalSize.width;

    if (displayWidth < _mobile) {
      state = DisplayMode.mobile;
    } else if (displayWidth < _tablet) {
      state = DisplayMode.tablet;
    } else {
      state = DisplayMode.desktop;
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}

final displayModeProvider =
    StateNotifierProvider<DisplayModeStateNotifier, DisplayMode>(
  (_) => DisplayModeStateNotifier(),
);
