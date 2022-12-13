import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/utils/capitalize.dart';
import 'package:app/utils/dto_constants.dart';
import 'package:app/utils/form_validators.dart';

part 'username_field.g.dart';

@hcwidget
Widget _usernameField(BuildContext context, {String? initialValue}) {
  final i18n = Translations.of(context);
  final username = capitalize(i18n.form.labels.username);

  return FormBuilderTextField(
    name: 'username',
    initialValue: initialValue,
    autovalidateMode: AutovalidateMode.onUserInteraction,
    autocorrect: false,
    decoration: InputDecoration(
      labelText: username,
      isDense: true,
      border: const OutlineInputBorder(),
    ),
    validator: FormBuilderValidators.compose([
      FormBuilderValidators.required(),
      FormValidators.alphanumeric(
        i18n.form.errorTexts.alphanumeric(field: username),
      ),
      FormBuilderValidators.maxLength(DtoConstants.maxNumChUsername),
      FormBuilderValidators.minLength(DtoConstants.minNumChUsername),
    ]),
    onChanged: print,
  );
}
