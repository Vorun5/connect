import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:app/data/dto/user.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/providers/auth_provider.dart';
import 'package:app/providers/my_profile.dart';
import 'package:app/utils/gaps.dart';
import 'package:app/utils/paddings.dart';
import 'package:app/utils/themes.dart';
import 'package:app/widgets/basic_widgets/error_text.dart';
import 'package:app/widgets/basic_widgets/hoverable.dart';
import 'package:app/widgets/event_form.dart';
import 'package:app/widgets/user_preview.dart';
import 'package:flag/flag_widget.dart';
import 'package:flutter/material.dart';
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
          padding: const EdgeInsets.all(Paddings.small),
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
                      onTap: () {
                        Navigator.of(context).pop();
                        eventForm(context, ref);
                      },
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
                        padding: const EdgeInsets.only(
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
                    const Divider(),
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
        padding: const EdgeInsets.only(bottom: Paddings.normal),
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
                  icon: const Icon(Icons.edit),
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
