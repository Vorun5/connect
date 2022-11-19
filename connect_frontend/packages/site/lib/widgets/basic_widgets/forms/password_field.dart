import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:site/i18n/strings.g.dart';
import 'package:site/utils/capitalize.dart';
import 'package:site/utils/dto_constants.dart';
import 'package:site/utils/form_validators.dart';
import 'package:site/utils/gaps.dart';
import 'package:site/utils/style_constants.dart';

part 'password_field.g.dart';

@hcwidget
Widget _passwordField(BuildContext context) {
  final i18n = Translations.of(context);
  final isPasswordVisible = useState(false);
  final password = capitalize(i18n.form.labels.password);

  return FormBuilderTextField(
    name: 'password',
    autovalidateMode: AutovalidateMode.onUserInteraction,
    autocorrect: false,
    obscureText: !isPasswordVisible.value,
    validator: FormBuilderValidators.compose([
      FormBuilderValidators.required(),
      FormValidators.alphanumeric(
        i18n.form.errorTexts.alphanumeric(field: password),
      ),
      FormBuilderValidators.maxLength(maxNumChPassword),
      FormBuilderValidators.minLength(minNumChPassword),
    ]),
    decoration: InputDecoration(
      isDense: true,
      border: const OutlineInputBorder(),
      labelText: password,
      suffixIcon: Padding(
        padding: const EdgeInsets.only(right: Gaps.tiny),
        child: IconButton(
          splashRadius: defaultIconSplashRadius,
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
