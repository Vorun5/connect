// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'icon_button_with_background.dart';

// **************************************************************************
// FunctionalWidgetGenerator
// **************************************************************************

class IconButtonWithBackground extends StatelessWidget {
  const IconButtonWithBackground({
    Key? key,
    required this.icon,
    required this.onPressed,
    this.iconColor = Colors.white,
    this.backgroundColor = ColorPalette.link,
    this.radius = defaultRadiusIconWithBackground,
    this.splashRadius = defaultSplashRadiusIconWithBackground,
  }) : super(key: key);

  final Icon icon;

  final void Function()? onPressed;

  final Color iconColor;

  final Color backgroundColor;

  final double radius;

  final double splashRadius;

  @override
  Widget build(BuildContext _context) => _iconButtonWithBackground(
        icon: icon,
        onPressed: onPressed,
        iconColor: iconColor,
        backgroundColor: backgroundColor,
        radius: radius,
        splashRadius: splashRadius,
      );
}
