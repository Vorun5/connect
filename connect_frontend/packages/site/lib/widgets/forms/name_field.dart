import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:site/i18n/strings.g.dart';
import 'package:site/utils/capitalize.dart';
import 'package:site/utils/dto_constants.dart';

part 'name_field.g.dart';

@swidget
Widget _nameField(BuildContext context) {
  final i18n = Translations.of(context);

  return FormBuilderTextField(
    name: 'name',
    autovalidateMode: AutovalidateMode.onUserInteraction,
    autocorrect: false,
    decoration: InputDecoration(
      labelText: capitalize(i18n.form.labels.name),
      isDense: true,
      border: const OutlineInputBorder(),
    ),
    validator: FormBuilderValidators.compose([
      FormBuilderValidators.required(),
      FormBuilderValidators.maxLength(maxNumChName),
      FormBuilderValidators.minLength(minNumChName),
    ]),
    onChanged: print,
  );
}
