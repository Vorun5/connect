import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:app/data/dto/user.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/providers/auth_provider.dart';
import 'package:app/providers/my_profile_provider.dart';
import 'package:app/utils/gaps.dart';
import 'package:app/utils/paddings.dart';
import 'package:app/utils/themes.dart';
import 'package:app/widgets/basic_widgets/error_text.dart';
import 'package:app/widgets/basic_widgets/hoverable.dart';
import 'package:app/widgets/user_preview.dart';

part 'user_drawer.g.dart';

@hcwidget
Widget _userDrawer(BuildContext context, WidgetRef ref) {
  final myProfile = ref.watch(myProfileProvider);
  final i18n = Translations.of(context);

  return Drawer(
    child: ListView(
      shrinkWrap: true,
      children: [
        myProfile.when(
          data: (user) {
            if (user == null) {
              return Center(child: ErrorText(i18n.unknownError));
            }

            return Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                _DrawerHeader(user),
                _UserSettings(user),
              ],
            );
          },
          error: (error, _) => Center(child: ErrorText(error.toString())),
          loading: () => const Center(child: CircularProgressIndicator()),
        ),
      ],
    ),
  );
}

@swidget
Widget __drawerHeader(User user) => SizedBox(
      height: 180,
      child: DrawerHeader(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            UserPreview(user),
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
                      theme: theme == Themes.dark ? Themes.light : Themes.dark,
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );

// TODO(Vorun5):
// поля (порядок не правльный):
// 1. Изменить язык
// 2. Выйти из приложения
// 3. Изменить профиль (перенапралять на route '/u')
// 4. Посмотреть свой профиль
// 5. Возможно, изменить свой пароль и добавить почту для
// восстановления доступа, но это в самый конец если будет время
// конфиденциальность + язык
@hcwidget
Widget __userSettings(BuildContext context, WidgetRef ref, User user) =>
    Padding(
      padding: const EdgeInsets.all(Paddings.small),
      child: Column(
        children: [
          _DrawerButton(
            text: 'Мой профиль',
            icon: const Icon(
              Icons.account_circle,
              color: Colors.amber,
            ),
            onTap: () => context
                .goNamed('user-profile', params: {'username': user.username}),
          ),
          _DrawerButton(
            text: 'Настройки',
            icon: const Icon(
              Icons.settings,
              color: Colors.lime,
            ),
            onTap: () => context.goNamed('edit'),
          ),
          // _DrawerButton(
          //   text: 'Язык',
          //   icon: const Icon(
          //     Icons.language_outlined,
          //     color: Color.fromARGB(255, 195, 88, 245),
          //   ),
          //   onTap: () {},
          // ),
          // _DrawerButton(
          //   text: 'Конфиденциальность',
          //   icon: const Icon(
          //     Icons.security,
          //     color: Color.fromARGB(255, 7, 226, 255),
          //   ),
          //   onTap: () {},
          // ),
          _DrawerButton(
            text: 'Выйти из приложения',
            icon: const Icon(
              Icons.sentiment_very_dissatisfied_sharp,
              color: Color.fromARGB(255, 238, 52, 114),
            ),
            onTap: () async {
              await ref.read(authProvider.notifier).logout();
            },
          ),
        ],
      ),
    );

@swidget
Widget __drawerButton({
  required String text,
  required Icon icon,
  required void Function()? onTap,
}) =>
    Hoverable(
      child: (isHovered) => GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: isHovered
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
              const Icon(
                Icons.double_arrow,
                size: 15,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
