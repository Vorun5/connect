import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:app/utils/constants.dart';

part 'avatar.g.dart';

@swidget
Widget _avatar(
  BuildContext context,
  String? url, {
  double radius = Constants.avatarRadius,
}) =>
    CircleAvatar(
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      radius: radius,
      child: CircleAvatar(
        backgroundColor: Constants.imageBackgroundColor,
        radius: Constants.avatarRadius - 2,
        backgroundImage: NetworkImage(url ?? Constants.noAvatar),
      ),
    );
