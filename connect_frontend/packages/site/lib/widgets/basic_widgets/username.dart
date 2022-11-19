import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:site/utils/color_palette.dart';
import 'package:site/utils/font_size.dart';

part 'username.g.dart';

@swidget
Widget _username(String username) => Text(
      style: const TextStyle(
        fontSize: FontSize.small,
        color: ColorPalette.link,
      ),
      '@$username',
    );
