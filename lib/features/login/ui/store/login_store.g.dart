// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginStore on _LoginStoreBase, Store {
  final _$isLoggedInStatusAtom = Atom(name: '_LoginStoreBase.isLoggedInStatus');

  @override
  StateStatus get isLoggedInStatus {
    _$isLoggedInStatusAtom.context.enforceReadPolicy(_$isLoggedInStatusAtom);
    _$isLoggedInStatusAtom.reportObserved();
    return super.isLoggedInStatus;
  }

  @override
  set isLoggedInStatus(StateStatus value) {
    _$isLoggedInStatusAtom.context.conditionallyRunInAction(() {
      super.isLoggedInStatus = value;
      _$isLoggedInStatusAtom.reportChanged();
    }, _$isLoggedInStatusAtom, name: '${_$isLoggedInStatusAtom.name}_set');
  }

  final _$isLoggedInAtom = Atom(name: '_LoginStoreBase.isLoggedIn');

  @override
  bool get isLoggedIn {
    _$isLoggedInAtom.context.enforceReadPolicy(_$isLoggedInAtom);
    _$isLoggedInAtom.reportObserved();
    return super.isLoggedIn;
  }

  @override
  set isLoggedIn(bool value) {
    _$isLoggedInAtom.context.conditionallyRunInAction(() {
      super.isLoggedIn = value;
      _$isLoggedInAtom.reportChanged();
    }, _$isLoggedInAtom, name: '${_$isLoggedInAtom.name}_set');
  }

  final _$errorMessageAtom = Atom(name: '_LoginStoreBase.errorMessage');

  @override
  String get errorMessage {
    _$errorMessageAtom.context.enforceReadPolicy(_$errorMessageAtom);
    _$errorMessageAtom.reportObserved();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.context.conditionallyRunInAction(() {
      super.errorMessage = value;
      _$errorMessageAtom.reportChanged();
    }, _$errorMessageAtom, name: '${_$errorMessageAtom.name}_set');
  }

  final _$doLoginAsyncAction = AsyncAction('doLogin');

  @override
  Future<void> doLogin(BuildContext context, PostLoginRequestModel params,
      {RouteRedirectModel redirectOnLogin}) {
    return _$doLoginAsyncAction.run(
        () => super.doLogin(context, params, redirectOnLogin: redirectOnLogin));
  }

  final _$getAuthenticationAsyncAction = AsyncAction('getAuthentication');

  @override
  Future<void> getAuthentication(BuildContext context) {
    return _$getAuthenticationAsyncAction
        .run(() => super.getAuthentication(context));
  }

  final _$logoutAsyncAction = AsyncAction('logout');

  @override
  Future<void> logout(BuildContext context, {bool redirectToHome}) {
    return _$logoutAsyncAction
        .run(() => super.logout(context, redirectToHome: redirectToHome));
  }
}
