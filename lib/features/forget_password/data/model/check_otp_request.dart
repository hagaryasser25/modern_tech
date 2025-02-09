import 'package:json_annotation/json_annotation.dart';

part 'check_otp_request.g.dart';

@JsonSerializable()
class CheckOtpRequest {
  String? token;
  int? otp;

  CheckOtpRequest({this.token, this.otp});

  factory CheckOtpRequest.fromJson(Map<String, dynamic> json) =>
      _$CheckOtpRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CheckOtpRequestToJson(this);
}
