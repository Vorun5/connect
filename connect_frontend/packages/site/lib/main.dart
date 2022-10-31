import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:site/data/services/storage_service.dart';
import 'package:site/i18n/strings.g.dart';
import 'package:site/utils/app_router.dart';
import 'package:site/utils/themes.dart';

part 'main.g.dart';

void main() async {
  // ignore: avoid-ignoring-return-values
  WidgetsFlutterBinding.ensureInitialized();
  // ignore: avoid-ignoring-return-values
  LocaleSettings.useDeviceLocale();
  final isPlatformDark =
      WidgetsBinding.instance.window.platformBrightness == Brightness.dark;
  final initTheme = isPlatformDark ? Themes.darkTheme : Themes.ligthTheme;
  runApp(
    TranslationProvider(
      child: ThemeProvider(
        initTheme: initTheme,
        child: const ProviderScope(child: _App()),
      ),
    ),
  );
}

@hcwidget
Widget __app(BuildContext context, WidgetRef ref) {
  final router = ref.watch(routerProvider);

  return MaterialApp.router(
    locale: TranslationProvider.of(context).flutterLocale,
    supportedLocales: LocaleSettings.supportedLocales,
    localizationsDelegates: GlobalMaterialLocalizations.delegates,
    debugShowCheckedModeBanner: false,
    routeInformationParser: router.routeInformationParser,
    routerDelegate: router.routerDelegate,
    routeInformationProvider: router.routeInformationProvider,
  );
}
