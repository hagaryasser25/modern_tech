// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_body_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterBodyRequest _$RegisterBodyRequestFromJson(Map<String, dynamic> json) =>
    RegisterBodyRequest(
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      password: json['password'] as String?,
      name: json['name'] as String?,
      confirmPassword: json['password_confirmation'] as String?,
    );

Map<String, dynamic> _$RegisterBodyRequestToJson(
        RegisterBodyRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'phone': instance.phone,
      'password': instance.password,
      'name': instance.name,
      'password_confirmation': instance.confirmPassword,
    };
