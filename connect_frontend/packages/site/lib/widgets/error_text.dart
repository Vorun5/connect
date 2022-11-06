import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:site/utils/color_palette.dart';
import 'package:site/utils/font_size.dart';

part 'error_text.g.dart';

@swidget
Widget _errorText(String text) => Text(
      style: const TextStyle(
        fontSize: FontSize.normal,
        color: ColorPalette.danger,
      ),
      text,
    );
