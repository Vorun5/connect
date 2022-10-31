import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:site/providers/auth_provider.dart';
import 'package:site/utils/font_size.dart';
import 'package:site/utils/themes.dart';
import 'package:site/widgets/username.dart';

part 'home.g.dart';

@hcwidget
Widget _home(BuildContext context, WidgetRef ref) {
  return ThemeSwitchingArea(
    child: Scaffold(
      drawer: const _HomeDrawer(),
      appBar: AppBar(
        title: const Text(
          'Home',
        ),
        actions: [
          IconButton(
              onPressed: () {
                ref.read(authProvider.notifier).logout();
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: () => context.goNamed('home'),
              child: const Text('Home'),
            ),
            TextButton(
              onPressed: () => context.goNamed('login'),
              child: const Text('Login'),
            ),
            TextButton(
              onPressed: () => context.goNamed('sing-up'),
              child: const Text('Sing Up'),
            ),
          ],
        ),
      ),
    ),
  );
}

@swidget
Widget __homeDrawer() => Drawer(
      child: Column(
        children: [
          DrawerHeader(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(
                        'https://avatars.githubusercontent.com/u/80065908?v=4',
                      ),
                    ),
                    ThemeSwitcher.withTheme(
                      builder: (context, switcher, theme) => IconButton(
                        hoverColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        // TODO(Vorun5): сделать анимацию при переключении как в tg
                        icon: Icon(
                          theme == Themes.darkTheme
                              ? Icons.nightlight_round
                              : Icons.wb_sunny,
                        ),
                        onPressed: () {
                          switcher.changeTheme(
                            theme: theme.brightness == Brightness.light
                                ? Themes.darkTheme
                                : Themes.ligthTheme,
                          );
                        },
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      style: TextStyle(fontSize: FontSize.normal),
                      'Firdavsi Nurov',
                    ),
                    Username('@nurov'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
