import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:app/data/api/api_services.dart';
import 'package:app/data/dto/event_to_create.dart';
import 'package:app/data/dto/user.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/providers/auth_provider.dart';
import 'package:app/providers/my_profile.dart';
import 'package:app/utils/form_validators.dart';
import 'package:app/utils/gaps.dart';
import 'package:app/utils/paddings.dart';
import 'package:app/utils/style_constants.dart';
import 'package:app/utils/themes.dart';
import 'package:app/widgets/basic_widgets/error_text.dart';
import 'package:app/widgets/basic_widgets/forms/form_text_field.dart';
import 'package:app/widgets/basic_widgets/hoverable.dart';
import 'package:app/widgets/user_preview.dart';
import 'package:flag/flag_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'user_drawer.g.dart';

@hcwidget
Widget _userDrawer(BuildContext context, WidgetRef ref) {
  final myProfile = ref.watch(myProfileProvider);
  final i18n = Translations.of(context);
  final selectsLanguage = useState(false);

  return Drawer(
    child: myProfile.when(
      data: (user) {
        if (user == null) {
          return Center(child: ErrorText(i18n.unknownError));
        }

        return Padding(
          padding: EdgeInsets.all(Paddings.small),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    _DrawerHeader(user),
                    _DrawerButton(
                      text: i18n.drawer.myProfile,
                      icon: const Icon(
                        Icons.account_circle,
                        color: Colors.amber,
                      ),
                      onTap: () => context.goNamed('user-profile',
                          params: {'username': user.username}),
                    ),
                    _DrawerButton(
                      text: i18n.drawer.createEvent,
                      icon: const Icon(
                        Icons.event,
                        color: Colors.orangeAccent,
                      ),
                      onTap: () => _createEventForm(context),
                    ),
                    _DrawerButton(
                      text: i18n.drawer.language,
                      isOpen: selectsLanguage.value,
                      icon: const Icon(
                        Icons.language_outlined,
                        color: Color.fromARGB(255, 195, 88, 245),
                      ),
                      onTap: () =>
                          selectsLanguage.value = !selectsLanguage.value,
                    ),
                    if (selectsLanguage.value)
                      Padding(
                        padding: EdgeInsets.only(
                          top: Paddings.tiny,
                          right: Paddings.tiny,
                          bottom: Paddings.small,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: AppLocale.values
                              .map(
                                (locale) => TextButton.icon(
                                  onPressed: () async {
                                    final storage =
                                        await SharedPreferences.getInstance();
                                    final result = await storage.setString(
                                        'language', locale.languageCode);
                                    if (result) {
                                      LocaleSettings.setLocale(locale);
                                    }
                                  },
                                  icon: Flag.fromString(
                                    locale.languageCode.toLowerCase() != 'en'
                                        ? locale.languageCode
                                        : 'GB',
                                    width: 20,
                                    height: 20,
                                  ),
                                  label: Text(
                                    locale.languageCode.toUpperCase(),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      )
                  ],
                ),
              ),
              Align(
                alignment: FractionalOffset.bottomCenter,
                child: Column(
                  children: [
                    Divider(),
                    _DrawerButton(
                      text: i18n.drawer.exit,
                      icon: const Icon(
                        Icons.sentiment_very_dissatisfied_sharp,
                        color: Color.fromARGB(255, 238, 52, 114),
                      ),
                      onTap: () => showDialog<void>(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text(i18n.exit),
                          content: Text(i18n.drawer.logoutOfApp),
                          actions: [
                            TextButton(
                              onPressed: () async => await ref
                                  .read(authProvider.notifier)
                                  .logout(),
                              child: Text(i18n.buttons.yes),
                            ),
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: Text(i18n.buttons.no),
                            ),
                          ],
                        ),
                      ),
                    ),
                    _DrawerButton(
                      text: i18n.drawer.confidentiality,
                      icon: const Icon(
                        Icons.security,
                        color: Color.fromARGB(255, 7, 226, 255),
                      ),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
      error: (error, _) => Center(child: ErrorText(error.toString())),
      loading: () => const Center(child: CircularProgressIndicator()),
    ),
  );
}

@swidget
Widget __drawerHeader(BuildContext context, User user) => SizedBox(
      height: 180,
      child: DrawerHeader(
        padding: EdgeInsets.only(bottom: Paddings.normal),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            UserPreview(user),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ThemeSwitcher.withTheme(
                  builder: (context, switcher, theme) => IconButton(
                    hoverColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    icon: Icon(
                      theme == Themes.dark
                          ? Icons.nightlight_round
                          : Icons.wb_sunny,
                    ),
                    onPressed: () async {
                      final storage = await SharedPreferences.getInstance();
                      final res =
                          await storage.setBool('theme', theme != Themes.dark);
                      if (res) {
                        switcher.changeTheme(
                          isReversed: theme == Themes.dark,
                          theme:
                              theme == Themes.dark ? Themes.light : Themes.dark,
                        );
                      }
                    },
                  ),
                ),
                IconButton(
                  onPressed: () => context.goNamed('edit'),
                  icon: Icon(Icons.edit),
                ),
              ],
            ),
          ],
        ),
      ),
    );

@swidget
Widget __drawerButton({
  required String text,
  required Icon icon,
  required void Function()? onTap,
  bool isOpen = false,
}) =>
    Hoverable(
      child: (isHovered) => GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: isHovered || isOpen
                ? const Color.fromARGB(71, 168, 65, 154)
                : Colors.transparent,
            borderRadius: const BorderRadius.all(
              Radius.circular(Paddings.small),
            ),
          ),
          padding: const EdgeInsets.all(Paddings.small),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  icon,
                  Gaps.small,
                  Text(text),
                ],
              ),
              Icon(
                isOpen
                    ? Icons.keyboard_double_arrow_down_outlined
                    : Icons.keyboard_double_arrow_right_outlined,
                size: 20,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );

Future<void> _createEventForm(BuildContext context) {
  final formKey = GlobalKey<FormBuilderState>();
  final i18n = Translations.of(context);

  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Center(child: Text(i18n.drawer.createEvent)),
        content: FormBuilder(
          child: SizedBox(
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
        ),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: Text(i18n.buttons.create),
            onPressed: () async {
              final currentState = formKey.currentState;

              if (currentState?.saveAndValidate() ?? false) {
                final value = currentState?.value;
                if (value != null) {
                  final response = await ApiServices.createEvent(
                      EventToCreate.fromJson(value));
                  if (response != null) {
                    print('event create');
                  } else {
                    print('event not create');
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
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
