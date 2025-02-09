// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_otp_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckOtpResponse _$CheckOtpResponseFromJson(Map<String, dynamic> json) =>
    CheckOtpResponse(
      status: json['status'] as bool?,
      message: json['message'] == null
          ? null
          : Name.fromJson(json['message'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CheckOtpResponseToJson(CheckOtpResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };
