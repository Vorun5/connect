import 'package:app/data/api/api_services.dart';
import 'package:app/data/dto/event_to_create.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/utils/form_validators.dart';
import 'package:app/utils/gaps.dart';
import 'package:app/utils/style_constants.dart';
import 'package:app/widgets/basic_widgets/forms/form_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

Future<void> createEventForm(BuildContext context) {
  final formKey = GlobalKey<FormBuilderState>();
  final i18n = Translations.of(context);

  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Center(child: Text(i18n.drawer.createEvent)),
        content: SizedBox(
          width: StyleConstants.maxFormWidth,
          child: FormBuilder(
            key: formKey,
            child: Column(
              children: [
                FormTextField(
                  name: 'name',
                  label: i18n.form.labels.name,
                  validator: FormValidators.name,
                ),
                Gaps.normal,
                FormTextField(
                  name: 'description',
                  label: i18n.form.labels.description,
                  validator: FormValidators.description,
                ),
              ],
            ),
          ),
        ),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: Text(i18n.buttons.create),
            onPressed: () async {
              final messenger = ScaffoldMessenger.of(context);
              final currentState = formKey.currentState;

              if (currentState?.saveAndValidate() ?? false) {
                final value = currentState?.value;
                if (value != null) {
                  final response = await ApiServices.createEvent(
                      EventToCreate.fromJson(value));
                  if (response == null) {
                    messenger.showSnackBar(
                      const SnackBar(
                        content: Text('Не удалось создать мероприятие'),
                      ),
                    );
                  }
                }
              } else {
                debugPrint(
                  formKey.currentState?.value.toString(),
                );
                debugPrint('validation failed');
              }
            },
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: Text(i18n.buttons.close),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      );
    },
  );
}
