import 'package:modern_tech/features/registertaion/data/model/register_body_response.dart';

import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_service.dart';
import '../model/register_body_request.dart';

class RegisterRepo {
  final ApiService _apiService;

  RegisterRepo(this._apiService);
  Future<ApiResult<RegisterBodyResponse>> register(
      RegisterBodyRequest registerRequestBody) async {
    try {
      var response = await _apiService.register(registerRequestBody);
      if (response.authToken == null) {
        return ApiResult.failure(response.message ?? "",
            );
      }
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(error.toString());
    }
  }
}
