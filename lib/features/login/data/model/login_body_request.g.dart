// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_body_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginBodyRequest _$LoginBodyRequestFromJson(Map<String, dynamic> json) =>
    LoginBodyRequest(
      user: json['user'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$LoginBodyRequestToJson(LoginBodyRequest instance) =>
    <String, dynamic>{
      'user': instance.user,
      'password': instance.password,
    };
