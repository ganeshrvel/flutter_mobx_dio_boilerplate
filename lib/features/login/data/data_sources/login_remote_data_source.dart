import 'package:data_channel/data_channel.dart';
import 'package:flutter_mobx_dio_boilerplate/common/api_client/api_client.dart';
import 'package:flutter_mobx_dio_boilerplate/features/login/data/models/post_login_request_model.dart';
import 'package:flutter_mobx_dio_boilerplate/features/login/data/models/post_login_response_model.dart';
import 'package:flutter_mobx_dio_boilerplate/features/login/data/models/user_model.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class LoginRemoteDataSource {
  final ApiClient _apiClient;

  LoginRemoteDataSource(this._apiClient);

  Future<DC<Exception, PostLoginResponseModel>> postLogin(
    PostLoginRequestModel params,
  ) async {
    try {
      final response = await _apiClient.post(
        'api/v1/users/login',
        params,
      );

      return DC.data(
        PostLoginResponseModel.fromJson(response.data as Map<String, dynamic>),
      );
    } on Exception catch (e) {
      return DC.error(
        e,
      );
    }
  }

  Future<DC<Exception, UserModel>> getLogin() async {
    try {
      final response = await _apiClient.get('api/v1/users/getLogin');

      return DC.data(
        UserModel.fromJson(
          response.data as Map<String, dynamic>,
        ),
      );
    } on Exception catch (e) {
      return DC.error(
        e,
      );
    }
  }
}
