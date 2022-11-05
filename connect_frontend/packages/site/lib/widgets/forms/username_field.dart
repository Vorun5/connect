import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:site/i18n/strings.g.dart';
import 'package:site/utils/capitalize.dart';
import 'package:site/utils/dto_constants.dart';
import 'package:site/utils/form_validators.dart';

part 'username_field.g.dart';

@hcwidget
Widget _usernameField(BuildContext context) {
  final i18n = Translations.of(context);

  return FormBuilderTextField(
    name: 'username',
    autovalidateMode: AutovalidateMode.onUserInteraction,
    autocorrect: false,
    decoration: InputDecoration(
      labelText: capitalize(i18n.form.labels.username),
      isDense: true,
      border: const OutlineInputBorder(),
    ),
    validator: FormBuilderValidators.compose([
      FormBuilderValidators.required(),
      FormValidators.alphanumeric(i18n.form.errorTexts.alphanumeric),
      FormBuilderValidators.maxLength(maxNumChUsername),
      FormBuilderValidators.minLength(minNumChUsername),
    ]),
    onChanged: print,
  );
}
