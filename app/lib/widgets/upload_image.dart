import 'package:app/utils/gaps.dart';
import 'package:app/utils/photo_link.dart';
import 'package:app/widgets/basic_widgets/forms/form_text_field.dart';
import 'package:app/widgets/snack_bars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';

part 'upload_image.g.dart';

@swidget
Widget _uploadImage(
  BuildContext context, {
  required String? url,
  required void Function(String newUrl) onChangeUrl,
  IconData icon = Icons.add_a_photo_outlined,
}) {
  final formKey = GlobalKey<FormBuilderState>();

  return IconButton(
    onPressed: () => showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text("Change image"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  FormBuilder(
                    key: formKey,
                    child: FormTextField(
                        name: 'url',
                        label: 'Url',
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                        ])),
                  ),
                  Gaps.small,
                  OutlinedButton(
                      onPressed: () async {
                        final messenger = ScaffoldMessenger.of(context);
                        final currentState = formKey.currentState;
                        final navigator = Navigator.of(context);

                        if (currentState?.saveAndValidate() ?? false) {
                          final value = currentState?.value;
                          if (value != null) {
                            final newUrl = value['url'] as String;
                            final isValidUrl = await validateImage(newUrl);
                            if (isValidUrl) {
                              onChangeUrl(newUrl);
                              debugPrint(url);
                              messenger.showSnackBar(
                                successSnackBar('Фон успешно обновлён!'),
                              );
                            } else {
                              messenger.showSnackBar(
                                errorSnackBar('Не валидная ссылка на фото!'),
                              );
                            }
                            debugPrint(value.toString());
                            navigator.pop(context);
                          }
                        } else {
                          debugPrint(
                            formKey.currentState?.value.toString(),
                          );
                          debugPrint('validation failed');
                        }
                      },
                      child: const Text('Save'))
                ],
              ),
            )),
    icon: Icon(
      icon,
      size: 35,
    ),
  );
}
