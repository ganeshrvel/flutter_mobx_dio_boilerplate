import 'package:injectable/injectable.dart';
import 'package:data_channel/data_channel.dart';
import 'package:flutter_mobx_dio_boilerplate/features/login/data/models/authentication_model.dart';
import 'package:flutter_mobx_dio_boilerplate/features/login/data/models/post_login_request_model.dart';
import 'package:flutter_mobx_dio_boilerplate/features/login/data/models/post_login_response_model.dart';
import 'package:flutter_mobx_dio_boilerplate/features/login/data/repositories/login_repository.dart';

@lazySingleton
class LoginController {
  final LoginRepository _loginRepository;

  LoginController(this._loginRepository);

  Future<DC<Exception, PostLoginResponseModel>> postLogin(
    PostLoginRequestModel params,
  ) async {
    final _postLoginData = await _loginRepository.postLogin(params);

    if (_postLoginData.hasError || _postLoginData.data?.tokenId == null) {
      return DC.error(
        _postLoginData.error,
      );
    }

    final _localCacheData = await _loginRepository.setDeviceAuthenticationCache(
      AuthenticationModel(tokenId: _postLoginData.data?.tokenId),
    );

    if (_localCacheData.hasError) {
      return DC.error(
        _localCacheData.error,
      );
    }

    return DC.data(
      _postLoginData.data,
    );
  }

  // todo init -> fetch token from url -> validate -> refresh
  Future<DC<Exception, AuthenticationModel>> getAuthenticationData() async {
    return _loginRepository.getAuthenticationData();
  }

  Future<DC<Exception, AuthenticationModel>>
      getDeviceAuthenticationData() async {
    return _loginRepository.getDeviceAuthenticationData();
  }

  Future<DC<Exception, bool>> logout() async {
    return _loginRepository.deleteDeviceAuthenticationCache();
  }
}
