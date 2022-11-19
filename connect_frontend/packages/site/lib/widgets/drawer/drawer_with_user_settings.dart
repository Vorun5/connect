import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:site/data/dto/user.dart';
import 'package:site/i18n/strings.g.dart';
import 'package:site/providers/my_profile_provider.dart';
import 'package:site/utils/font_size.dart';
import 'package:site/utils/themes.dart';
import 'package:site/widgets/basic_widgets/error_text.dart';
import 'package:site/widgets/basic_widgets/username.dart';

part 'drawer_with_user_settings.g.dart';

const noAvatarUrl =
    'https://t3.ftcdn.net/jpg/01/09/00/64/360_F_109006426_388PagqielgjFTAMgW59jRaDmPJvSBUL.jpg';

@hcwidget
Widget _drawerWithUserSettings(BuildContext context, WidgetRef ref) {
  final myProfile = ref.watch(myProfileProvider);
  final i18n = Translations.of(context);

  return Drawer(
    child: Center(
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
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _UserPreviewProfile(user),
                  _UserSettings(user),
                ],
              );
            },
            error: (error, _) => Center(child: ErrorText(error.toString())),
            loading: () => const Center(child: CircularProgressIndicator()),
          ),
        ],
      ),
    ),
  );
}

@swidget
Widget __userPreviewProfile(User user) => DrawerHeader(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(
                  // TODO(Vorun5): кнопка на установку аватарки или перенапраления на изменения профиля
                  user.profileImageUrl ?? noAvatarUrl,
                ),
              ),
              ThemeSwitcher.withTheme(
                builder: (context, switcher, theme) => IconButton(
                  hoverColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  // TODO(Vorun5): сделать анимацию при переключении как в tg
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
                        theme:
                            theme == Themes.dark ? Themes.light : Themes.dark,
                      );
                    }
                  },
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                style: const TextStyle(fontSize: FontSize.normal),
                user.name,
              ),
              Username(user.username),
            ],
          ),
        ],
      ),
    );

@swidget
Widget __userSettings(User user) => Column(
      children: const [
        // TODO(Vorun5):
        // поля (порядок не правльный):
        // 1. Изменить язык
        // 2. Выйти из приложения
        // 3. Изменить профиль (перенапралять на route '/u')
        // 4. Посмотреть свой профиль
        // 5. Возможно, изменить свой пароль и добавить почту для
        // восстановления доступа, но это в самый конец если будет время
        Text('Setting 1'),
        Text('Setting 2'),
        Text('Setting 3'),
        Text('Setting 4'),
      ],
    );
