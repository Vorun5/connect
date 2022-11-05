import 'dart:async';

import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:site/i18n/strings.g.dart';
import 'package:site/providers/auth_provider.dart';
import 'package:site/providers/router_provider.dart';
import 'package:site/utils/themes.dart';

part 'main.g.dart';

// TODO(Vorun5): slang опять не хочет билдиться, поэтому попробовать с билдить потом

void main() async {
  // ignore: avoid-ignoring-return-values
  WidgetsFlutterBinding.ensureInitialized();
  // ignore: avoid-ignoring-return-values
  LocaleSettings.useDeviceLocale();
  final isPlatformDark =
      WidgetsBinding.instance.window.platformBrightness == Brightness.dark;
  final initTheme = isPlatformDark ? Themes.dark : Themes.light;
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

  useEffect(
    () {
      unawaited(ref.read(authProvider.notifier).checkLocalToken());

      return null;
    },
    [],
  );

  return MaterialApp.router(
    debugShowCheckedModeBanner: false,
    localizationsDelegates: const [
      FormBuilderLocalizations.delegate,
      ...GlobalMaterialLocalizations.delegates,
    ],
    supportedLocales: LocaleSettings.supportedLocales,
    locale: TranslationProvider.of(context).flutterLocale,
    routeInformationParser: router.routeInformationParser,
    routerDelegate: router.routerDelegate,
    routeInformationProvider: router.routeInformationProvider,
  );
}
