import 'package:app/utils/paddings.dart';
import 'package:app/utils/style_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:slang/builder/utils/string_extensions.dart';

part 'form_text_field.g.dart';

@swidget
Widget _formTextField(
  BuildContext context, {
  required String name,
  required String label,
  String? initialValue,
  String? Function(String?)? validator,
  IconData? suffixIcon,
  void Function()? onPressed,
}) =>
    FormBuilderTextField(
      name: name,
      initialValue: initialValue,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      autocorrect: false,
      decoration: InputDecoration(
        labelText: label.capitalize(),
        isDense: true,
        border: const OutlineInputBorder(),
        suffixIcon: suffixIcon != null
            ? Padding(
                padding: const EdgeInsets.only(right: Paddings.tiny),
                child: IconButton(
                  splashRadius: StyleConstants.defaultIconSplashRadius,
                  icon: Icon(suffixIcon),
                  onPressed: onPressed,
                ),
              )
            : null,
      ),
      validator: validator,
      onChanged: print,
    );
