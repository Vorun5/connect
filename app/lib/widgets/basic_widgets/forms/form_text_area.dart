import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:slang/builder/utils/string_extensions.dart';

part 'form_text_area.g.dart';

@swidget
Widget _formTextArea(
  BuildContext context, {
  required String label,
  String name = 'description',
  String? initialValue,
  String? Function(String?)? validator,
}) =>
    FormBuilderTextField(
      keyboardType: TextInputType.multiline,
      maxLines: 4,
      name: name,
      initialValue: initialValue,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      autocorrect: false,
      decoration: InputDecoration(
        hintText: label.capitalize(),
        isDense: true,
        border: const OutlineInputBorder(),
      ),
      validator: validator,
      onChanged: print,
    );
