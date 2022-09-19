// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'animated_button.dart';

// **************************************************************************
// FunctionalWidgetGenerator
// **************************************************************************

class AnimatedButton extends HookWidget {
  const AnimatedButton(
      {Key? key,
      required this.isHovered,
      required this.initialText,
      required this.iconData,
      required this.iconSize,
      required this.animationDuration,
      required this.buttonStyle})
      : super(key: key);

  final bool isHovered;

  final String initialText;

  final IconData iconData;

  final double iconSize;

  final Duration animationDuration;

  final AnimatedButtonStyle buttonStyle;

  @override
  Widget build(BuildContext _context) => _animatedButton(
      isHovered: isHovered,
      initialText: initialText,
      iconData: iconData,
      iconSize: iconSize,
      animationDuration: animationDuration,
      buttonStyle: buttonStyle);
}
