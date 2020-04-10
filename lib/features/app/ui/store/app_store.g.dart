// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AppStore on _AppStoreBase, Store {
  final _$languageAtom = Atom(name: '_AppStoreBase.language');

  @override
  LanguageModel get language {
    _$languageAtom.context.enforceReadPolicy(_$languageAtom);
    _$languageAtom.reportObserved();
    return super.language;
  }

  @override
  set language(LanguageModel value) {
    _$languageAtom.context.conditionallyRunInAction(() {
      super.language = value;
      _$languageAtom.reportChanged();
    }, _$languageAtom, name: '${_$languageAtom.name}_set');
  }

  final _$themeAtom = Atom(name: '_AppStoreBase.theme');

  @override
  ThemeModel get theme {
    _$themeAtom.context.enforceReadPolicy(_$themeAtom);
    _$themeAtom.reportObserved();
    return super.theme;
  }

  @override
  set theme(ThemeModel value) {
    _$themeAtom.context.conditionallyRunInAction(() {
      super.theme = value;
      _$themeAtom.reportChanged();
    }, _$themeAtom, name: '${_$themeAtom.name}_set');
  }

  final _$setAppLanguageAsyncAction = AsyncAction('setAppLanguage');

  @override
  Future<void> setAppLanguage(
      BuildContext context, LanguageModel languageData) {
    return _$setAppLanguageAsyncAction
        .run(() => super.setAppLanguage(context, languageData));
  }

  final _$getAppLanguageAsyncAction = AsyncAction('getAppLanguage');

  @override
  Future<void> getAppLanguage() {
    return _$getAppLanguageAsyncAction.run(() => super.getAppLanguage());
  }

  final _$setAppThemeAsyncAction = AsyncAction('setAppTheme');

  @override
  Future<void> setAppTheme(BuildContext context, ThemeModel data) {
    return _$setAppThemeAsyncAction.run(() => super.setAppTheme(context, data));
  }

  final _$getAppThemeAsyncAction = AsyncAction('getAppTheme');

  @override
  Future<void> getAppTheme() {
    return _$getAppThemeAsyncAction.run(() => super.getAppTheme());
  }
}
