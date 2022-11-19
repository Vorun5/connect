import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:site/data/dto/user_to_sign_up.dart';
import 'package:site/i18n/strings.g.dart';
import 'package:site/providers/auth_provider.dart';
import 'package:site/utils/capitalize.dart';
import 'package:site/utils/color_palette.dart';
import 'package:site/utils/font_size.dart';
import 'package:site/utils/gaps.dart';
import 'package:site/utils/screen_layout.dart';
import 'package:site/utils/style_constants.dart';
import 'package:site/widgets/basic_widgets/forms/name_field.dart';
import 'package:site/widgets/basic_widgets/forms/password_field.dart';
import 'package:site/widgets/basic_widgets/forms/username_field.dart';
import 'package:site/widgets/basic_widgets/icon_button_with_background.dart';

part 'sign_up.g.dart';

final _formKey = GlobalKey<FormBuilderState>();

@hcwidget
Widget _signUp(BuildContext context, WidgetRef ref) {
  final errorStatus = useState<int?>(null);
  final i18n = Translations.of(context);

  return ScreenLayout(
    child: Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(normalGap),
            constraints: const BoxConstraints(
              minWidth: minFormWidth,
              maxWidth: maxFormWidth,
            ),
            child: Column(
              children: [
                Text(
                  i18n.auth.signUpTitle,
                  style: const TextStyle(fontSize: FontSize.big),
                ),
                Gaps.big,
                if (errorStatus.value != null)
                  Container(
                    padding: const EdgeInsets.only(bottom: largeGap),
                    child: Text(
                      i18n.auth.signUpErrors[errorStatus.value.toString()] ??
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
                      const UsernameField(),
                      Gaps.normal,
                      const NameField(),
                      Gaps.normal,
                      const PasswordField(),
                      Gaps.normal,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            capitalize(i18n.auth.signUp),
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
                                      .signUp(UserToSignUp.fromJson(value));
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
                          Text(i18n.auth.haveAccount),
                          Gaps.tiny,
                          TextButton(
                            onPressed: () => context.goNamed('login'),
                            child: Text('${capitalize(i18n.auth.login)}!'),
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
    ),
  );
}
