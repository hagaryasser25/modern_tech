// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_otp_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendOtpResponse _$SendOtpResponseFromJson(Map<String, dynamic> json) =>
    SendOtpResponse(
      status: json['status'] as bool?,
      message: json['message'] == null
          ? null
          : Name.fromJson(json['message'] as Map<String, dynamic>),
      otp: (json['otp'] as num?)?.toInt(),
      token: json['token'] as String?,
    );

Map<String, dynamic> _$SendOtpResponseToJson(SendOtpResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'otp': instance.otp,
      'token': instance.token,
    };
