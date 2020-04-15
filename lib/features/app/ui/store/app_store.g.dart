// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AppStore on _AppStoreBase, Store {
  Computed<bool> _$isAppSettingsLoadedComputed;

  @override
  bool get isAppSettingsLoaded => (_$isAppSettingsLoadedComputed ??=
          Computed<bool>(() => super.isAppSettingsLoaded,
              name: '_AppStoreBase.isAppSettingsLoaded'))
      .value;

  final _$languageAtom = Atom(name: '_AppStoreBase.language');

  @override
  LanguageModel get language {
    _$languageAtom.reportRead();
    return super.language;
  }

  @override
  set language(LanguageModel value) {
    _$languageAtom.reportWrite(value, super.language, () {
      super.language = value;
    });
  }

  final _$themeAtom = Atom(name: '_AppStoreBase.theme');

  @override
  ThemeModel get theme {
    _$themeAtom.reportRead();
    return super.theme;
  }

  @override
  set theme(ThemeModel value) {
    _$themeAtom.reportWrite(value, super.theme, () {
      super.theme = value;
    });
  }

  final _$setAppLanguageAsyncAction =
      AsyncAction('_AppStoreBase.setAppLanguage');

  @override
  Future<void> setAppLanguage(
      BuildContext context, LanguageModel languageData) {
    return _$setAppLanguageAsyncAction
        .run(() => super.setAppLanguage(context, languageData));
  }

  final _$getAppLanguageAsyncAction =
      AsyncAction('_AppStoreBase.getAppLanguage');

  @override
  Future<void> getAppLanguage() {
    return _$getAppLanguageAsyncAction.run(() => super.getAppLanguage());
  }

  final _$setAppThemeAsyncAction = AsyncAction('_AppStoreBase.setAppTheme');

  @override
  Future<void> setAppTheme(BuildContext context, ThemeModel data) {
    return _$setAppThemeAsyncAction.run(() => super.setAppTheme(context, data));
  }

  final _$getAppThemeAsyncAction = AsyncAction('_AppStoreBase.getAppTheme');

  @override
  Future<void> getAppTheme() {
    return _$getAppThemeAsyncAction.run(() => super.getAppTheme());
  }

  @override
  String toString() {
    return '''
language: ${language},
theme: ${theme},
isAppSettingsLoaded: ${isAppSettingsLoaded}
    ''';
  }
}
