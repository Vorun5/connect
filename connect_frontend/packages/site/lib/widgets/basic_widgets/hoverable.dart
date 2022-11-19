import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';

part 'hoverable.g.dart';

@hwidget
Widget _hoverable({required Widget Function(bool isHovered) child}) {
  final isHover = useState(false);

  void onEntered({required bool isHovered}) {
    isHover.value = isHovered;
  }

  return MouseRegion(
    cursor: SystemMouseCursors.click,
    onEnter: (_) => onEntered(isHovered: true),
    onExit: (_) => onEntered(isHovered: false),
    child: child(isHover.value),
  );
}
