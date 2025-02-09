import 'package:json_annotation/json_annotation.dart';

import '../../../../core/models/language_model.dart';

part 'check_otp_response.g.dart';

@JsonSerializable()
class CheckOtpResponse {
  bool? status;
  Name? message;

  CheckOtpResponse({
    this.status,
    this.message,
  });

  factory CheckOtpResponse.fromJson(Map<String, dynamic> json) =>
      _$CheckOtpResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CheckOtpResponseToJson(this);
}
