import 'package:json_annotation/json_annotation.dart';
import 'package:modern_tech/core/models/language_model.dart';

part 'update_password_response.g.dart';

@JsonSerializable()
class UpdatePasswordResponse {
  bool? status;
  Name? message;


  UpdatePasswordResponse({this.status, this.message});

  factory UpdatePasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdatePasswordResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UpdatePasswordResponseToJson(this);
}
