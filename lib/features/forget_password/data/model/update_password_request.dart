import 'package:json_annotation/json_annotation.dart';

part 'update_password_request.g.dart';

@JsonSerializable()
class UpdatePasswordRequest {
  String? token;

  @JsonKey(name: "new_password")
  String? newPassword;

  @JsonKey(name: "new_password_confirmation")
  String? newPasswordConfirmation;

  UpdatePasswordRequest({this.token, this.newPassword,this.newPasswordConfirmation});

  factory UpdatePasswordRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdatePasswordRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpdatePasswordRequestToJson(this);
}
