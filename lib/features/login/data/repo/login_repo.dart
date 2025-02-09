import 'package:modern_tech/features/login/data/model/login_body_request.dart';
import 'package:modern_tech/features/registertaion/data/model/register_body_response.dart';

import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_service.dart';

class LoginRepo {
  final ApiService _apiService;

  LoginRepo(this._apiService);
  Future<ApiResult<RegisterBodyResponse>> register(
      LoginBodyRequest loginRequestBody) async {
    try {
      var response = await _apiService.login(loginRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(error.toString());
    }
  }
}
