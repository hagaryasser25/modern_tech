// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_otp_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckOtpRequest _$CheckOtpRequestFromJson(Map<String, dynamic> json) =>
    CheckOtpRequest(
      token: json['token'] as String?,
      otp: (json['otp'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CheckOtpRequestToJson(CheckOtpRequest instance) =>
    <String, dynamic>{
      'token': instance.token,
      'otp': instance.otp,
    };
