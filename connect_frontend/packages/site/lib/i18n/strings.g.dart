/// Generated file. Do not edit.
///
/// Locales: 2
/// Strings: 38 (19 per locale)
///
/// Built on 2022-11-26 at 08:56 UTC

// coverage:ignore-file
// ignore_for_file: type=lint

import 'package:flutter/widgets.dart';
import 'package:slang/builder/model/node.dart';
import 'package:slang_flutter/slang_flutter.dart';
export 'package:slang_flutter/slang_flutter.dart';

const AppLocale _baseLocale = AppLocale.en;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.en) // set locale
/// - Locale locale = AppLocale.en.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.en) // locale check
enum AppLocale with BaseAppLocale<AppLocale, _StringsEn> {
	en(languageCode: 'en', build: _StringsEn.build),
	ru(languageCode: 'ru', build: _StringsRu.build);

	const AppLocale({required this.languageCode, this.scriptCode, this.countryCode, required this.build}); // ignore: unused_element

	@override final String languageCode;
	@override final String? scriptCode;
	@override final String? countryCode;
	@override final TranslationBuilder<AppLocale, _StringsEn> build;

	/// Gets current instance managed by [LocaleSettings].
	_StringsEn get translations => LocaleSettings.instance.translationMap[this]!;
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of t).
/// Configurable via 'translate_var'.
///
/// Usage:
/// String a = t.someKey.anotherKey;
/// String b = t['someKey.anotherKey']; // Only for edge cases!
_StringsEn get t => LocaleSettings.instance.currentTranslations;

/// Method B: Advanced
///
/// All widgets using this method will trigger a rebuild when locale changes.
/// Use this if you have e.g. a settings page where the user can select the locale during runtime.
///
/// Step 1:
/// wrap your App with
/// TranslationProvider(
/// 	child: MyApp()
/// );
///
/// Step 2:
/// final t = Translations.of(context); // Get t variable.
/// String a = t.someKey.anotherKey; // Use t variable.
/// String b = t['someKey.anotherKey']; // Only for edge cases!
class Translations {
	Translations._(); // no constructor

	static _StringsEn of(BuildContext context) => InheritedLocaleData.of<AppLocale, _StringsEn>(context).translations;
}

/// The provider for method B
class TranslationProvider extends BaseTranslationProvider<AppLocale, _StringsEn> {
	TranslationProvider({required super.child}) : super(
		initLocale: LocaleSettings.instance.currentLocale,
		initTranslations: LocaleSettings.instance.currentTranslations,
	);

	static InheritedLocaleData<AppLocale, _StringsEn> of(BuildContext context) => InheritedLocaleData.of<AppLocale, _StringsEn>(context);
}

/// Method B shorthand via [BuildContext] extension method.
/// Configurable via 'translate_var'.
///
/// Usage (e.g. in a widget's build method):
/// context.t.someKey.anotherKey
extension BuildContextTranslationsExtension on BuildContext {
	_StringsEn get t => TranslationProvider.of(this).translations;
}

/// Manages all translation instances and the current locale
class LocaleSettings extends BaseFlutterLocaleSettings<AppLocale, _StringsEn> {
	LocaleSettings._() : super(utils: AppLocaleUtils.instance);

	static final instance = LocaleSettings._();

	// static aliases (checkout base methods for documentation)
	static AppLocale get currentLocale => instance.currentLocale;
	static Stream<AppLocale> getLocaleStream() => instance.getLocaleStream();
	static AppLocale setLocale(AppLocale locale) => instance.setLocale(locale);
	static AppLocale setLocaleRaw(String rawLocale) => instance.setLocaleRaw(rawLocale);
	static AppLocale useDeviceLocale() => instance.useDeviceLocale();
	static List<Locale> get supportedLocales => instance.supportedLocales;
	static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
	static void setPluralResolver({String? language, AppLocale? locale, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver}) => instance.setPluralResolver(
		language: language,
		locale: locale,
		cardinalResolver: cardinalResolver,
		ordinalResolver: ordinalResolver,
	);
}

/// Provides utility functions without any side effects.
class AppLocaleUtils extends BaseAppLocaleUtils<AppLocale, _StringsEn> {
	AppLocaleUtils._() : super(baseLocale: _baseLocale, locales: AppLocale.values);

	static final instance = AppLocaleUtils._();

	// static aliases (checkout base methods for documentation)
	static AppLocale parse(String rawLocale) => instance.parse(rawLocale);
	static AppLocale parseLocaleParts({required String languageCode, String? scriptCode, String? countryCode}) => instance.parseLocaleParts(languageCode: languageCode, scriptCode: scriptCode, countryCode: countryCode);
	static AppLocale findDeviceLocale() => instance.findDeviceLocale();
}

// translations

// Path: <root>
class _StringsEn implements BaseTranslations<AppLocale, _StringsEn> {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsEn.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, _StringsEn> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final _StringsEn _root = this; // ignore: unused_field

	// Translations
	late final _StringsFormEn form = _StringsFormEn._(_root);
	String get unknownError => 'Unknown error!';
	late final _StringsAuthEn auth = _StringsAuthEn._(_root);
	Map<String, String> get statusCode => {
		'400': 'Request data failed server validation  (status code: 400)',
		'403': 'No access (status code: 403)',
		'404': 'Nothing found (status code: 404)',
		'500': 'Server error. Sorry >_< (status code: 500)',
	};
}

// Path: form
class _StringsFormEn {
	_StringsFormEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	late final _StringsFormLabelsEn labels = _StringsFormLabelsEn._(_root);
	late final _StringsFormErrorTextsEn errorTexts = _StringsFormErrorTextsEn._(_root);
}

// Path: auth
class _StringsAuthEn {
	_StringsAuthEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get login => 'login';
	String get signUp => 'sign up';
	String get notHaveAccount => 'Need an account?';
	String get haveAccount => 'Already have a account?';
	String get loginTitle => 'Welcome back!';
	String get signUpTitle => 'Let\'s get started!';
	Map<String, String> get loginErrors => {
		'403': 'Wrong username or password🤔',
		'500': 'Server error. Sorry💀',
	};
	Map<String, String> get signUpErrors => {
		'403': 'A user with the same username already exists🤔',
		'500': 'Server error. Sorry💀',
	};
}

// Path: form.labels
class _StringsFormLabelsEn {
	_StringsFormLabelsEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get username => 'username';
	String get name => 'name';
	String get password => 'password';
}

// Path: form.errorTexts
class _StringsFormErrorTextsEn {
	_StringsFormErrorTextsEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String alphanumeric({required Object field}) => '${field} can only consist of latin letters and numbers';
}

// Path: <root>
class _StringsRu implements _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsRu.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.ru,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ru>.
	@override final TranslationMetadata<AppLocale, _StringsEn> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	@override late final _StringsRu _root = this; // ignore: unused_field

	// Translations
	@override late final _StringsFormRu form = _StringsFormRu._(_root);
	@override String get unknownError => 'Неизвестная ошибка!';
	@override late final _StringsAuthRu auth = _StringsAuthRu._(_root);
	@override Map<String, String> get statusCode => {
		'400': 'Request data failed server validation  (status code: 400)',
		'403': 'No access (status code: 403)',
		'404': 'Nothing found (status code: 404)',
		'500': 'Server error. Sorry >_< (status code: 500)',
	};
}

// Path: form
class _StringsFormRu implements _StringsFormEn {
	_StringsFormRu._(this._root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override late final _StringsFormLabelsRu labels = _StringsFormLabelsRu._(_root);
	@override late final _StringsFormErrorTextsRu errorTexts = _StringsFormErrorTextsRu._(_root);
}

// Path: auth
class _StringsAuthRu implements _StringsAuthEn {
	_StringsAuthRu._(this._root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get login => 'войти';
	@override String get signUp => 'зарегистрироваться';
	@override String get notHaveAccount => 'Нет учётной записи?';
	@override String get haveAccount => 'Уже есть учётная запись?';
	@override String get loginTitle => 'С возвращением!';
	@override String get signUpTitle => 'Давай начнём!';
	@override Map<String, String> get loginErrors => {
		'403': 'Неверное имя пользователя или пароль🤔',
		'500': 'Ошибка сервера. Извините💀',
	};
	@override Map<String, String> get signUpErrors => {
		'403': 'Это имя пользователя уже занято🤔',
		'500': 'Ошибка сервера. Извините💀',
	};
}

// Path: form.labels
class _StringsFormLabelsRu implements _StringsFormLabelsEn {
	_StringsFormLabelsRu._(this._root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get username => 'имя пользователя';
	@override String get name => 'имя';
	@override String get password => 'пароль';
}

// Path: form.errorTexts
class _StringsFormErrorTextsRu implements _StringsFormErrorTextsEn {
	_StringsFormErrorTextsRu._(this._root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String alphanumeric({required Object field}) => '${field} может состоять только из латинских букв и цифр';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on _StringsEn {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'form.labels.username': return 'username';
			case 'form.labels.name': return 'name';
			case 'form.labels.password': return 'password';
			case 'form.errorTexts.alphanumeric': return ({required Object field}) => '${field} can only consist of latin letters and numbers';
			case 'unknownError': return 'Unknown error!';
			case 'auth.login': return 'login';
			case 'auth.signUp': return 'sign up';
			case 'auth.notHaveAccount': return 'Need an account?';
			case 'auth.haveAccount': return 'Already have a account?';
			case 'auth.loginTitle': return 'Welcome back!';
			case 'auth.signUpTitle': return 'Let\'s get started!';
			case 'auth.loginErrors.403': return 'Wrong username or password🤔';
			case 'auth.loginErrors.500': return 'Server error. Sorry💀';
			case 'auth.signUpErrors.403': return 'A user with the same username already exists🤔';
			case 'auth.signUpErrors.500': return 'Server error. Sorry💀';
			case 'statusCode.400': return 'Request data failed server validation  (status code: 400)';
			case 'statusCode.403': return 'No access (status code: 403)';
			case 'statusCode.404': return 'Nothing found (status code: 404)';
			case 'statusCode.500': return 'Server error. Sorry >_< (status code: 500)';
			default: return null;
		}
	}
}

extension on _StringsRu {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'form.labels.username': return 'имя пользователя';
			case 'form.labels.name': return 'имя';
			case 'form.labels.password': return 'пароль';
			case 'form.errorTexts.alphanumeric': return ({required Object field}) => '${field} может состоять только из латинских букв и цифр';
			case 'unknownError': return 'Неизвестная ошибка!';
			case 'auth.login': return 'войти';
			case 'auth.signUp': return 'зарегистрироваться';
			case 'auth.notHaveAccount': return 'Нет учётной записи?';
			case 'auth.haveAccount': return 'Уже есть учётная запись?';
			case 'auth.loginTitle': return 'С возвращением!';
			case 'auth.signUpTitle': return 'Давай начнём!';
			case 'auth.loginErrors.403': return 'Неверное имя пользователя или пароль🤔';
			case 'auth.loginErrors.500': return 'Ошибка сервера. Извините💀';
			case 'auth.signUpErrors.403': return 'Это имя пользователя уже занято🤔';
			case 'auth.signUpErrors.500': return 'Ошибка сервера. Извините💀';
			case 'statusCode.400': return 'Request data failed server validation  (status code: 400)';
			case 'statusCode.403': return 'No access (status code: 403)';
			case 'statusCode.404': return 'Nothing found (status code: 404)';
			case 'statusCode.500': return 'Server error. Sorry >_< (status code: 500)';
			default: return null;
		}
	}
}
