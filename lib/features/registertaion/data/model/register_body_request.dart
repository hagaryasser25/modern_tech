import 'package:json_annotation/json_annotation.dart';

part 'register_body_request.g.dart';

@JsonSerializable()
class RegisterBodyRequest {
  String? email;
  String? phone;
  String? password;
  String? name;

  @JsonKey(name: "password_confirmation")
  String? confirmPassword;

  RegisterBodyRequest({
    this.email,
    this.phone,
    this.password,
    this.name,
    this.confirmPassword,
  });

  factory RegisterBodyRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterBodyRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterBodyRequestToJson(this);
}
