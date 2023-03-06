/// Generated file. Do not edit.
///
/// Locales: 2
/// Strings: 84 (42 per locale)
///
/// Built on 2023-03-06 at 11:10 UTC

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
	late final _StringsButtonsEn buttons = _StringsButtonsEn._(_root);
	String get unknownError => 'Unknown error!';
	late final _StringsAuthEn auth = _StringsAuthEn._(_root);
	Map<String, String> get statusCode => {
		'400': 'Request data failed server validation (status code: 400)',
		'403': 'No access (status code: 403)',
		'404': 'Nothing found (status code: 404)',
		'500': 'Server error. Sorry >_< (status code: 500)',
	};
	late final _StringsDrawerEn drawer = _StringsDrawerEn._(_root);
	late final _StringsScreenTitlesEn screenTitles = _StringsScreenTitlesEn._(_root);
	late final _StringsUserProfileEn userProfile = _StringsUserProfileEn._(_root);
	late final _StringsHomePageEn homePage = _StringsHomePageEn._(_root);
	String get exit => 'Exit';
}

// Path: form
class _StringsFormEn {
	_StringsFormEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	late final _StringsFormLabelsEn labels = _StringsFormLabelsEn._(_root);
	late final _StringsFormErrorTextsEn errorTexts = _StringsFormErrorTextsEn._(_root);
}

// Path: buttons
class _StringsButtonsEn {
	_StringsButtonsEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get update => 'Update';
	String get create => 'Create';
	String get yes => 'Yes';
	String get no => 'No';
	String get close => 'Close';
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

// Path: drawer
class _StringsDrawerEn {
	_StringsDrawerEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get myProfile => 'My profile';
	String get createEvent => 'Create event';
	String get language => 'Language';
	String get exit => 'Log out';
	String get confidentiality => 'Confidentiality';
	String get logoutOfApp => 'Are you sure want to exit?';
}

// Path: screenTitles
class _StringsScreenTitlesEn {
	_StringsScreenTitlesEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get userProfile => 'User profile';
	String get editProfile => 'Edit profile';
	String get allEvents => 'All events';
}

// Path: userProfile
class _StringsUserProfileEn {
	_StringsUserProfileEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get aboutMe => 'About me';
}

// Path: homePage
class _StringsHomePageEn {
	_StringsHomePageEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get myEvents => 'My events';
	String get noEvents => 'You don\'t have any events';
	String get eventNotFound => 'Nothing found!';
	String get join => 'Join';
	String get application => 'Submit an application';
}

// Path: form.labels
class _StringsFormLabelsEn {
	_StringsFormLabelsEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get username => 'username';
	String get name => 'name';
	String get password => 'password';
	String get description => 'description';
	String get searchEventByName => 'Search events by name';
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
	@override late final _StringsButtonsRu buttons = _StringsButtonsRu._(_root);
	@override String get unknownError => 'Неизвестная ошибка!';
	@override late final _StringsAuthRu auth = _StringsAuthRu._(_root);
	@override Map<String, String> get statusCode => {
		'400': 'Request data failed server validation (status code: 400)',
		'403': 'No access (status code: 403)',
		'404': 'Nothing found (status code: 404)',
		'500': 'Server error. Sorry >_< (status code: 500)',
	};
	@override late final _StringsDrawerRu drawer = _StringsDrawerRu._(_root);
	@override late final _StringsScreenTitlesRu screenTitles = _StringsScreenTitlesRu._(_root);
	@override late final _StringsUserProfileRu userProfile = _StringsUserProfileRu._(_root);
	@override late final _StringsHomePageRu homePage = _StringsHomePageRu._(_root);
	@override String get exit => 'Выйти';
}

// Path: form
class _StringsFormRu implements _StringsFormEn {
	_StringsFormRu._(this._root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override late final _StringsFormLabelsRu labels = _StringsFormLabelsRu._(_root);
	@override late final _StringsFormErrorTextsRu errorTexts = _StringsFormErrorTextsRu._(_root);
}

// Path: buttons
class _StringsButtonsRu implements _StringsButtonsEn {
	_StringsButtonsRu._(this._root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get update => 'Обновить';
	@override String get create => 'Создать';
	@override String get yes => 'Да';
	@override String get no => 'Нет';
	@override String get close => 'Закрыть';
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

// Path: drawer
class _StringsDrawerRu implements _StringsDrawerEn {
	_StringsDrawerRu._(this._root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get myProfile => 'Мой профиль';
	@override String get createEvent => 'Создать мероприятие';
	@override String get language => 'Язык';
	@override String get exit => 'Выйти из приложения';
	@override String get confidentiality => 'Конфиденциальность';
	@override String get logoutOfApp => 'Вы точно хотите выти из приложения?';
}

// Path: screenTitles
class _StringsScreenTitlesRu implements _StringsScreenTitlesEn {
	_StringsScreenTitlesRu._(this._root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get userProfile => 'Профиль пользователя';
	@override String get editProfile => 'Редактировать профиль';
	@override String get allEvents => 'Все мероприятия';
}

// Path: userProfile
class _StringsUserProfileRu implements _StringsUserProfileEn {
	_StringsUserProfileRu._(this._root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get aboutMe => 'Обо мне';
}

// Path: homePage
class _StringsHomePageRu implements _StringsHomePageEn {
	_StringsHomePageRu._(this._root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get myEvents => 'Мои мероприятия';
	@override String get noEvents => 'У вас нет мероприятий';
	@override String get eventNotFound => 'Ничего не найдено!';
	@override String get join => 'Вступить';
	@override String get application => 'Подать заявку';
}

// Path: form.labels
class _StringsFormLabelsRu implements _StringsFormLabelsEn {
	_StringsFormLabelsRu._(this._root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get username => 'имя пользователя';
	@override String get name => 'имя';
	@override String get password => 'пароль';
	@override String get description => 'описание';
	@override String get searchEventByName => 'Найти мероприятия по названию';
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
			case 'form.labels.description': return 'description';
			case 'form.labels.searchEventByName': return 'Search events by name';
			case 'form.errorTexts.alphanumeric': return ({required Object field}) => '${field} can only consist of latin letters and numbers';
			case 'buttons.update': return 'Update';
			case 'buttons.create': return 'Create';
			case 'buttons.yes': return 'Yes';
			case 'buttons.no': return 'No';
			case 'buttons.close': return 'Close';
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
			case 'statusCode.400': return 'Request data failed server validation (status code: 400)';
			case 'statusCode.403': return 'No access (status code: 403)';
			case 'statusCode.404': return 'Nothing found (status code: 404)';
			case 'statusCode.500': return 'Server error. Sorry >_< (status code: 500)';
			case 'drawer.myProfile': return 'My profile';
			case 'drawer.createEvent': return 'Create event';
			case 'drawer.language': return 'Language';
			case 'drawer.exit': return 'Log out';
			case 'drawer.confidentiality': return 'Confidentiality';
			case 'drawer.logoutOfApp': return 'Are you sure want to exit?';
			case 'screenTitles.userProfile': return 'User profile';
			case 'screenTitles.editProfile': return 'Edit profile';
			case 'screenTitles.allEvents': return 'All events';
			case 'userProfile.aboutMe': return 'About me';
			case 'homePage.myEvents': return 'My events';
			case 'homePage.noEvents': return 'You don\'t have any events';
			case 'homePage.eventNotFound': return 'Nothing found!';
			case 'homePage.join': return 'Join';
			case 'homePage.application': return 'Submit an application';
			case 'exit': return 'Exit';
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
			case 'form.labels.description': return 'описание';
			case 'form.labels.searchEventByName': return 'Найти мероприятия по названию';
			case 'form.errorTexts.alphanumeric': return ({required Object field}) => '${field} может состоять только из латинских букв и цифр';
			case 'buttons.update': return 'Обновить';
			case 'buttons.create': return 'Создать';
			case 'buttons.yes': return 'Да';
			case 'buttons.no': return 'Нет';
			case 'buttons.close': return 'Закрыть';
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
			case 'statusCode.400': return 'Request data failed server validation (status code: 400)';
			case 'statusCode.403': return 'No access (status code: 403)';
			case 'statusCode.404': return 'Nothing found (status code: 404)';
			case 'statusCode.500': return 'Server error. Sorry >_< (status code: 500)';
			case 'drawer.myProfile': return 'Мой профиль';
			case 'drawer.createEvent': return 'Создать мероприятие';
			case 'drawer.language': return 'Язык';
			case 'drawer.exit': return 'Выйти из приложения';
			case 'drawer.confidentiality': return 'Конфиденциальность';
			case 'drawer.logoutOfApp': return 'Вы точно хотите выти из приложения?';
			case 'screenTitles.userProfile': return 'Профиль пользователя';
			case 'screenTitles.editProfile': return 'Редактировать профиль';
			case 'screenTitles.allEvents': return 'Все мероприятия';
			case 'userProfile.aboutMe': return 'Обо мне';
			case 'homePage.myEvents': return 'Мои мероприятия';
			case 'homePage.noEvents': return 'У вас нет мероприятий';
			case 'homePage.eventNotFound': return 'Ничего не найдено!';
			case 'homePage.join': return 'Вступить';
			case 'homePage.application': return 'Подать заявку';
			case 'exit': return 'Выйти';
			default: return null;
		}
	}
}
