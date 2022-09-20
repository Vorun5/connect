import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:site/i18n/strings.g.dart';

part 'main.g.dart';

void main() {
  // ignore: avoid-ignoring-return-values
  WidgetsFlutterBinding.ensureInitialized();
  // ignore: avoid-ignoring-return-values
  LocaleSettings.useDeviceLocale();

  runApp(TranslationProvider(child: const _MyApp()));
}

@swidget
Widget __myApp(BuildContext context) => MaterialApp(
      locale: TranslationProvider.of(context).flutterLocale,
      supportedLocales: LocaleSettings.supportedLocales,
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      debugShowCheckedModeBanner: false,
      home: const _MyHomePage(),
    );

@swidget
Widget __myHomePage(BuildContext context) {
  final trl = Translations.of(context);

  return Scaffold(
    body: Center(
      child: Text(trl.title),
    ),
  );
}
