import 'package:json_annotation/json_annotation.dart';

import '../../../../core/models/language_model.dart';

part 'send_otp_response.g.dart';

@JsonSerializable()
class SendOtpResponse {
  bool? status;
  Name? message;
  int? otp;
  String? token;


  SendOtpResponse({
    this.status,
    this.message,
    this.otp,
    this.token
  });

  factory SendOtpResponse.fromJson(Map<String, dynamic> json) =>
      _$SendOtpResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SendOtpResponseToJson(this);
}
