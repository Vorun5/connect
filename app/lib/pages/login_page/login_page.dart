import 'package:app/data/dto/user_to_login.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/providers/auth_provider.dart';
import 'package:app/providers/my_profile.dart';
import 'package:app/utils/capitalize.dart';
import 'package:app/utils/color_palette.dart';
import 'package:app/utils/font_size.dart';
import 'package:app/utils/form_validators.dart';
import 'package:app/utils/gaps.dart';
import 'package:app/utils/paddings.dart';
import 'package:app/utils/style_constants.dart';
import 'package:app/widgets/app_scaffold.dart';
import 'package:app/widgets/basic_widgets/forms/form_text_field.dart';
import 'package:app/widgets/basic_widgets/forms/password_field.dart';
import 'package:app/widgets/basic_widgets/icon_button_with_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'login_page.g.dart';

final _formKey = GlobalKey<FormBuilderState>();

@hcwidget
Widget _loginPage(BuildContext context, WidgetRef ref) {
  final errorStatus = useState<int?>(null);
  final i18n = Translations.of(context);
  final username = capitalize(i18n.form.labels.username);

  return AppScaffold(
    body: Center(
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(Paddings.normal),
          constraints: const BoxConstraints(
            minWidth: StyleConstants.minFormWidth,
            maxWidth: StyleConstants.maxFormWidth,
          ),
          child: Column(
            children: [
              Text(
                i18n.auth.loginTitle,
                style: const TextStyle(fontSize: FontSize.big),
              ),
              Gaps.big,
              if (errorStatus.value != null)
                Container(
                  padding: const EdgeInsets.only(bottom: Paddings.large),
                  child: Text(
                    i18n.auth.loginErrors[errorStatus.value.toString()] ??
                        i18n.unknownError,
                    style: const TextStyle(
                      color: ColorPalette.danger,
                    ),
                  ),
                ),
              FormBuilder(
                key: _formKey,
                child: Column(
                  children: [
                    FormTextField(
                      name: 'username',
                      label: 'Имя пользователя',
                      validator: FormValidators.username(
                        i18n.form.errorTexts.alphanumeric(field: username),
                      ),
                    ),
                    Gaps.normal,
                    const PasswordField(),
                    Gaps.normal,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          capitalize(i18n.auth.login),
                          style: const TextStyle(fontSize: FontSize.large),
                        ),
                        IconButtonWithBackground(
                          icon: const Icon(Icons.arrow_forward),
                          onPressed: () async {
                            final currentState = _formKey.currentState;

                            if (currentState?.saveAndValidate() ?? false) {
                              final value = currentState?.value;
                              if (value != null) {
                                debugPrint(value.toString());
                                errorStatus.value = await ref
                                    .read(authProvider.notifier)
                                    .login(UserToLogin.fromJson(value));
                                if (errorStatus.value == null) {
                                  ref.refresh(myProfileProvider);
                                }
                              }
                            } else {
                              debugPrint(
                                _formKey.currentState?.value.toString(),
                              );
                              debugPrint('validation failed');
                            }
                          },
                        ),
                      ],
                    ),
                    Gaps.normal,
                    Row(
                      children: [
                        Text(i18n.auth.notHaveAccount),
                        Gaps.tiny,
                        TextButton(
                          onPressed: () => context.goNamed('sing-up'),
                          child: Text('${capitalize(i18n.auth.signUp)}!'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
