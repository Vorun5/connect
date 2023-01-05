import 'package:app/data/api/api_services.dart';
import 'package:app/data/dto/user.dart';
import 'package:app/data/dto/user_to_update.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/providers/my_profile.dart';
import 'package:app/utils/capitalize.dart';
import 'package:app/utils/form_validators.dart';
import 'package:app/utils/gaps.dart';
import 'package:app/utils/paddings.dart';
import 'package:app/utils/style_constants.dart';
import 'package:app/widgets/basic_widgets/forms/form_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'edit_profile_form.g.dart';

final _formKey = GlobalKey<FormBuilderState>();

@hcwidget
Widget _editProfileForm(
  BuildContext context,
  WidgetRef ref, {
  required User user,
  required String? newProfileImageUrl,
  required String? newBackgroundUrl,
}) {
  final i18n = Translations.of(context);
  final username = capitalize(i18n.form.labels.username);
  final errorStatus = useState<int?>(null);

  return Padding(
    padding: const EdgeInsets.all(Paddings.normal),
    child: FormBuilder(
      key: _formKey,
      child: SizedBox(
        width: StyleConstants.maxFormWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            FormTextField(
              name: 'name',
              label: i18n.form.labels.name,
              initialValue: user.name,
              validator: FormValidators.name,
            ),
            Gaps.normal,
            FormTextField(
              name: 'username',
              label: i18n.form.labels.username,
              initialValue: user.username,
              validator: FormValidators.username(
                i18n.form.errorTexts.alphanumeric(field: username),
              ),
            ),
            Gaps.normal,
            FormTextField(
              name: 'description',
              label: i18n.form.labels.description,
              initialValue: user.description,
              validator: FormValidators.description,
            ),
            Gaps.normal,
            OutlinedButton(
              onPressed: () async {
                final currentState = _formKey.currentState;

                if (currentState?.saveAndValidate() ?? false) {
                  final value = currentState?.value;
                  if (value != null) {
                    var updatedUser = UserToUpdate.fromJson(value);
                    updatedUser = updatedUser.copyWith(id: user.id);
                    if (newBackgroundUrl != null) {
                      updatedUser = updatedUser.copyWith(
                        backgroundImageUrl: newBackgroundUrl,
                      );
                    }
                    if (newProfileImageUrl != null) {
                      updatedUser = updatedUser.copyWith(
                        profileImageUrl: newProfileImageUrl,
                      );
                    }

                    debugPrint(updatedUser.toString());
                    errorStatus.value =
                        await ApiServices.updateUserInformation(updatedUser);
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
              child: Text(i18n.buttons.update),
            ),
          ],
        ),
      ),
    ),
  );
}
