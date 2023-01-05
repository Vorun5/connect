import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';

part 'form_text_field.g.dart';

@swidget
Widget _formTextField(
  BuildContext context, {
  required String name,
  required String label,
  String? initialValue,
  String? Function(String?)? validator,
}) =>
    FormBuilderTextField(
      name: name,
      initialValue: initialValue,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      autocorrect: false,
      decoration: InputDecoration(
        labelText: label,
        isDense: true,
        border: const OutlineInputBorder(),
      ),
      validator: validator,
      onChanged: print,
    );
