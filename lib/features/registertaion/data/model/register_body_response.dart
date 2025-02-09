import 'package:json_annotation/json_annotation.dart';
import 'package:modern_tech/core/models/language_model.dart';

part 'register_body_response.g.dart';

@JsonSerializable()
class RegisterBodyResponse {
  bool? status;
  Name? message;
  String? authToken;
  Data? data;

  RegisterBodyResponse({this.status, this.message, this.authToken,this.data});

  factory RegisterBodyResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterBodyResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterBodyResponseToJson(this);
}

@JsonSerializable()
class Data {
  int? id;
  String? name;
  String? phone;
  String? email;

  Data({this.id, this.name, this.email, this.phone});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
