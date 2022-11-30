import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:site/i18n/strings.g.dart';
import 'package:site/utils/dto_constants.dart';

part 'description_field.g.dart';

// TODO: сделать как TextArea
@swidget
Widget _descriptionField(BuildContext context, {String? initialValue}) {
  final i18n = Translations.of(context);

  return FormBuilderTextField(
    name: 'description',
    initialValue: initialValue,
    autovalidateMode: AutovalidateMode.onUserInteraction,
    autocorrect: false,
    decoration: const InputDecoration(
      labelText: 'Описание',
      isDense: true,
      border: OutlineInputBorder(),
    ),
    validator: FormBuilderValidators.compose([
      FormBuilderValidators.maxLength(DtoConstants.maxDescriptionChUsername),
    ]),
    onChanged: print,
  );
}
