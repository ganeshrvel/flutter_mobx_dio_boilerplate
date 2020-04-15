// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginStore on _LoginStoreBase, Store {
  final _$isLoggedInStatusAtom = Atom(name: '_LoginStoreBase.isLoggedInStatus');

  @override
  StateStatus get isLoggedInStatus {
    _$isLoggedInStatusAtom.reportRead();
    return super.isLoggedInStatus;
  }

  @override
  set isLoggedInStatus(StateStatus value) {
    _$isLoggedInStatusAtom.reportWrite(value, super.isLoggedInStatus, () {
      super.isLoggedInStatus = value;
    });
  }

  final _$isLoggedInAtom = Atom(name: '_LoginStoreBase.isLoggedIn');

  @override
  bool get isLoggedIn {
    _$isLoggedInAtom.reportRead();
    return super.isLoggedIn;
  }

  @override
  set isLoggedIn(bool value) {
    _$isLoggedInAtom.reportWrite(value, super.isLoggedIn, () {
      super.isLoggedIn = value;
    });
  }

  final _$errorMessageAtom = Atom(name: '_LoginStoreBase.errorMessage');

  @override
  String get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  final _$doLoginAsyncAction = AsyncAction('_LoginStoreBase.doLogin');

  @override
  Future<void> doLogin(BuildContext context, PostLoginRequestModel params,
      {RouteRedirectModel redirectOnLogin}) {
    return _$doLoginAsyncAction.run(
        () => super.doLogin(context, params, redirectOnLogin: redirectOnLogin));
  }

  final _$getAuthenticationAsyncAction =
      AsyncAction('_LoginStoreBase.getAuthentication');

  @override
  Future<void> getAuthentication(BuildContext context) {
    return _$getAuthenticationAsyncAction
        .run(() => super.getAuthentication(context));
  }

  final _$logoutAsyncAction = AsyncAction('_LoginStoreBase.logout');

  @override
  Future<void> logout(BuildContext context, {bool redirectToHome}) {
    return _$logoutAsyncAction
        .run(() => super.logout(context, redirectToHome: redirectToHome));
  }

  @override
  String toString() {
    return '''
isLoggedInStatus: ${isLoggedInStatus},
isLoggedIn: ${isLoggedIn},
errorMessage: ${errorMessage}
    ''';
  }
}
