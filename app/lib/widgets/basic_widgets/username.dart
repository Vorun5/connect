import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:app/utils/color_palette.dart';
import 'package:app/utils/font_size.dart';
import 'package:app/widgets/basic_widgets/hoverable.dart';

part 'username.g.dart';

@swidget
Widget _username(BuildContext contex, String username) => GestureDetector(
      child: Hoverable(
        child: (isHovered) => Text(
          style: TextStyle(
            fontSize: FontSize.small,
            color: ColorPalette.link,
            decoration:
                isHovered ? TextDecoration.underline : TextDecoration.none,
          ),
          '@$username',
        ),
      ),
      onTap: () => contex.goNamed(
        'user-profile',
        params: {'username': username},
      ),
    );
