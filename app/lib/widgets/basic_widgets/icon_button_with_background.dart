import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:app/utils/color_palette.dart';

part 'icon_button_with_background.g.dart';

const defaultRadiusIconWithBackground = 20.0;
const defaultSplashRadiusIconWithBackground = 22.0;

@swidget
Widget _iconButtonWithBackground({
  required Icon icon,
  required void Function()? onPressed,
  Color iconColor = Colors.white,
  Color backgroundColor = ColorPalette.link,
  double radius = defaultRadiusIconWithBackground,
  double splashRadius = defaultSplashRadiusIconWithBackground,
}) =>
    CircleAvatar(
      backgroundColor: backgroundColor,
      radius: radius,
      child: IconButton(
        splashRadius: splashRadius,
        color: iconColor,
        onPressed: onPressed,
        icon: icon,
      ),
    );
