import 'package:modern_tech/features/forget_password/data/model/send_otp_request.dart';
import 'package:modern_tech/features/forget_password/data/model/send_otp_response.dart';


import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_service.dart';

class ForgetPasswordRepo {
  final ApiService _apiService;

  ForgetPasswordRepo(this._apiService);
  Future<ApiResult<SendOtpResponse>> sendOtp(
      SendOtpRequest sendOtpRequest) async {
    try {
      var response = await _apiService.sendOtp(sendOtpRequest);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(error.toString());
    }
  }
}
