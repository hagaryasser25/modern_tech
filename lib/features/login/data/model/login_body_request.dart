import 'package:json_annotation/json_annotation.dart';

part 'login_body_request.g.dart';

@JsonSerializable()
class LoginBodyRequest {
  String? user;
  String? password;


  LoginBodyRequest({
    this.user,
    this.password,
  });

  factory LoginBodyRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginBodyRequestFromJson(json);

  Map<String, dynamic> toJson() => _$LoginBodyRequestToJson(this);
}
