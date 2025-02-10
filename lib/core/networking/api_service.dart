import 'package:dio/dio.dart';
import 'package:modern_tech/core/networking/api_constants.dart';
import 'package:modern_tech/features/forget_password/data/model/send_otp_request.dart';
import 'package:modern_tech/features/forget_password/data/model/send_otp_response.dart';
import 'package:modern_tech/features/forget_password/data/model/update_password_request.dart';
import 'package:modern_tech/features/forget_password/data/model/update_password_response.dart';
import 'package:modern_tech/features/login/data/model/login_body_request.dart';
import 'package:modern_tech/features/registertaion/data/model/register_body_request.dart';
import 'package:modern_tech/features/registertaion/data/model/register_body_response.dart';
import 'package:retrofit/retrofit.dart';

import '../../features/forget_password/data/model/check_otp_request.dart';
import '../../features/forget_password/data/model/check_otp_response.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.register)
  Future<RegisterBodyResponse> register(
      @Body() RegisterBodyRequest registerRequestBody);

  @POST(ApiConstants.login)
  Future<RegisterBodyResponse> login(@Body() LoginBodyRequest loginRequestBody);

  @POST(ApiConstants.sendOtp)
  Future<SendOtpResponse> sendOtp(@Body() SendOtpRequest sendOtpRequest);

  @POST(ApiConstants.checkOtp)
  Future<CheckOtpResponse> checkOtp(@Body() CheckOtpRequest checkOtpRequest);

  @POST(ApiConstants.resetPassword)
  Future<UpdatePasswordResponse> updatePassword(@Body() UpdatePasswordRequest checkOtpRequest);
}
