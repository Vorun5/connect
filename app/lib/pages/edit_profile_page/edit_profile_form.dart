import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:app/data/api/api_services.dart';
import 'package:app/data/dto/user.dart';
import 'package:app/data/dto/user_to_update.dart';
import 'package:app/providers/my_profile_provider.dart';
import 'package:app/utils/gaps.dart';
import 'package:app/utils/paddings.dart';
import 'package:app/utils/style_constants.dart';
import 'package:app/widgets/basic_widgets/forms/description_field.dart';
import 'package:app/widgets/basic_widgets/forms/name_field.dart';
import 'package:app/widgets/basic_widgets/forms/username_field.dart';

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
  final errorStatus = useState<int?>(null);

  return Padding(
    padding: const EdgeInsets.all(Paddings.normal),
    child: FormBuilder(
      key: _formKey,
      child: SizedBox(
        width: StyleConstants.maxFormWidth,
        // constraints: const BoxConstraints(
        // maxWidth: StyleConstants.maxFormWidth,
        // minWidth: StyleConstants.minFormWidth,
        // ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            NameField(initialValue: user.name),
            Gaps.normal,
            UsernameField(initialValue: user.username),
            Gaps.normal,
            DescriptionField(initialValue: user.description),
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
              child: const Text('Обновить'),
            ),
          ],
        ),
      ),
    ),
  );
}
