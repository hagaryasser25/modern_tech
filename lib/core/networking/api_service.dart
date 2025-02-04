import 'package:dio/dio.dart';
import 'package:modern_tech/core/networking/api_constants.dart';
import 'package:modern_tech/features/registertaion/data/model/register_body_request.dart';
import 'package:modern_tech/features/registertaion/data/model/register_body_response.dart';
import 'package:retrofit/retrofit.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.register)
  Future<RegisterBodyResponse> register(RegisterBodyRequest registerRequestBody);
}
