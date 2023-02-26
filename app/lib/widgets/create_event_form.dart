import 'package:another_flushbar/flushbar.dart';
import 'package:app/data/api/api_services.dart';
import 'package:app/data/dto/event_to_create.dart';
import 'package:app/data/dto/tag.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/utils/dto_constants.dart';
import 'package:app/utils/font_size.dart';
import 'package:app/utils/form_validators.dart';
import 'package:app/utils/gaps.dart';
import 'package:app/utils/paddings.dart';
import 'package:app/utils/photo_link.dart';
import 'package:app/utils/style_constants.dart';
import 'package:app/widgets/basic_widgets/forms/form_text_area.dart';
import 'package:app/widgets/basic_widgets/forms/form_text_field.dart';
import 'package:app/widgets/snack_bars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'create_event_form.g.dart';

Future<void> createEventForm(BuildContext context, WidgetRef ref) {
  final formKey = GlobalKey<FormBuilderState>();
  final i18n = Translations.of(context);
  final tags = <Tag>[];

  return showDialog<void>(
    context: context,
    useRootNavigator: false,
    builder: (BuildContext context) => StatefulBuilder(
      builder: (context, setState) => AlertDialog(
        title: Center(child: Text(i18n.drawer.createEvent)),
        content: SizedBox(
          width: StyleConstants.maxFormWidth,
          child: FormBuilder(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FormTextField(
                    name: 'name',
                    label: i18n.form.labels.name,
                    validator: FormValidators.name,
                  ),
                  Gaps.normal,
                  FormTextArea(
                    label: i18n.form.labels.description,
                    validator: FormValidators.description,
                  ),
                  Gaps.normal,
                  const FormTextField(
                    name: 'imageUrl',
                    label: 'Image url',
                  ),
                  // Gaps.normal,
                  // FormBuilderDateTimePicker(
                  //   name: 'date',
                  //   fieldLabelText: 'Date',
                  //   initialDate: null,
                  //   decoration: const InputDecoration(
                  //     border: OutlineInputBorder(),
                  //   ),
                  // ),
                  Gaps.normal,
                  FormBuilderCheckbox(
                    name: 'entryAfterAdminApproval',
                    title: const Text('После одобрения создателя'),
                    initialValue: false,
                  ),
                  Gaps.normal,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Теги',
                        style: TextStyle(
                          fontSize: FontSize.normal,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Gaps.small,
                      _AddTagButton(
                          tags,
                          (Tag tag) => setState(() => tags.add(tag)),
                          (Tag tag) => setState(() => tags.remove(tag))),
                    ],
                  ),
                  Gaps.small,
                  Wrap(
                    spacing: Paddings.tiny,
                    runSpacing: Paddings.tiny,
                    children: tags
                        .map(
                          (tag) => Chip(
                            label: Text(tag.name),
                            onDeleted: () => setState(
                              () => tags.remove(tag),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
            ),
          ),
        ),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            onPressed: () async {
              final goNamed = context.goNamed;
              final messenger = ScaffoldMessenger.of(context);
              final navigator = Navigator.of(context);
              final currentState = formKey.currentState;

              if (currentState?.saveAndValidate() ?? false) {
                final value = currentState?.value;
                if (value != null) {
                  final imageUrl = value['imageUrl'] as String?;
                  if (imageUrl != null) {
                    final isValidUrl = await validateImage(imageUrl);
                    if (!isValidUrl) {
                      // ignore: use_build_context_synchronously
                      Flushbar(
                        backgroundColor: Colors.red,
                        message: 'Не валидная ссылка на фото',
                        duration: const Duration(seconds: 3),
                      ).show(context);
                      return;
                    }
                  }
                  print(value);
                  final response = await ApiServices.createEvent(
                    EventToCreate.fromJson(value).copyWith(tags: tags),
                  );
                  navigator.pop();
                  if (response == null) {
                    messenger.showSnackBar(
                      errorSnackBar('Не удалось создать мероприятие'),
                    );
                  } else {
                    goNamed('event', params: {'id': response.id});
                  }
                }
              } else {
                debugPrint(formKey.currentState?.value.toString());
                debugPrint('validation failed');
              }
            },
            child: Text(i18n.buttons.create),
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            onPressed: () => Navigator.of(context).pop(),
            child: Text(i18n.buttons.close),
          ),
        ],
      ),
    ),
  );
}

@hcwidget
Widget __addTagButton(
  BuildContext context,
  WidgetRef ref,
  List<Tag> tags,
  void Function(Tag tag) addTag,
  void Function(Tag tag) deleteTag,
) {
  final i18n = Translations.of(context);
  final searchTags = useState<List<Tag>?>(null);
  var search = '';

  return InputChip(
    label: const Icon(
      Icons.add,
      size: 20,
    ),
    onPressed: () {
      showDialog<void>(
        context: context,
        builder: (context) => StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text('Добавить теги'),
              content: SizedBox(
                width: StyleConstants.maxFormWidth - Paddings.normal * 2,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      maxLength: DtoConstants.maxNumChTagName,
                      decoration: InputDecoration(
                        labelText: 'Название',
                        isDense: true,
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(right: Paddings.tiny),
                          child: IconButton(
                            splashRadius:
                                StyleConstants.defaultIconSplashRadius,
                            icon: const Icon(Icons.search),
                            onPressed: () async {
                              if (search.isEmpty) {
                                setState(() => searchTags.value = null);
                                return;
                              }
                              final response =
                                  await ApiServices.searchTags(search);
                              setState(() => searchTags.value = response);
                            },
                          ),
                        ),
                        border: const OutlineInputBorder(),
                      ),
                      onChanged: (value) => search = value,
                    ),
                    if (searchTags.value != null &&
                        search.isNotEmpty &&
                        searchTags.value!
                            .where((e) => e.name == search)
                            .toList()
                            .isEmpty)
                      InputChip(
                        label: Text(search),
                        onPressed: () async {
                          final messenger = ScaffoldMessenger.of(context);
                          final tag = await ApiServices.createTag(search);
                          if (tag == null) {
                            messenger.showSnackBar(
                              errorSnackBar('Не удалось создать тег $search'),
                            );
                          } else {
                            addTag(tag);
                            setState(() => searchTags.value!.add(tag));
                          }
                        },
                      ),
                    Gaps.tiny,
                    if (searchTags.value != null &&
                        searchTags.value!.isNotEmpty)
                      Wrap(
                        spacing: Paddings.tiny,
                        runSpacing: Paddings.tiny,
                        children: searchTags.value!.map(
                          (tag) {
                            if (tags.contains(tag)) {
                              return Chip(
                                label: Text(tag.name),
                                onDeleted: () {
                                  deleteTag(tag);
                                  setState(() {});
                                },
                              );
                            }
                            return InputChip(
                              label: Text(tag.name),
                              onPressed: () {
                                addTag(tag);
                                setState(() {});
                              },
                            );
                          },
                        ).toList(),
                      ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  style: TextButton.styleFrom(
                    textStyle: Theme.of(context).textTheme.labelLarge,
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text(i18n.buttons.close),
                ),
              ],
            );
          },
        ),
      );
    },
  );
}
