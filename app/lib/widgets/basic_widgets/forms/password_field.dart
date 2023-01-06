import 'package:app/i18n/strings.g.dart';
import 'package:app/utils/dto_constants.dart';
import 'package:app/utils/form_validators.dart';
import 'package:app/utils/paddings.dart';
import 'package:app/utils/style_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:slang/builder/utils/string_extensions.dart';

part 'password_field.g.dart';

@hcwidget
Widget _passwordField(BuildContext context) {
  final i18n = Translations.of(context);
  final isPasswordVisible = useState(false);
  final password = i18n.form.labels.password;

  return FormBuilderTextField(
    name: 'password',
    autovalidateMode: AutovalidateMode.onUserInteraction,
    autocorrect: false,
    obscureText: !isPasswordVisible.value,
    validator: FormBuilderValidators.compose([
      FormBuilderValidators.required(),
      FormValidators.alphanumeric(
        i18n.form.errorTexts.alphanumeric(field: password.capitalize()),
      ),
      FormBuilderValidators.maxLength(DtoConstants.maxNumChPassword),
      FormBuilderValidators.minLength(DtoConstants.minNumChPassword),
    ]),
    decoration: InputDecoration(
      isDense: true,
      border: const OutlineInputBorder(),
      labelText: password.capitalize(),
      suffixIcon: Padding(
        padding: const EdgeInsets.only(right: Paddings.tiny),
        child: IconButton(
          splashRadius: StyleConstants.defaultIconSplashRadius,
          icon: Icon(
            isPasswordVisible.value ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: () {
            isPasswordVisible.value = !isPasswordVisible.value;
          },
        ),
      ),
    ),
    onChanged: print,
  );
}
