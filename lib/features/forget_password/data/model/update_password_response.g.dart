// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_password_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdatePasswordResponse _$UpdatePasswordResponseFromJson(
        Map<String, dynamic> json) =>
    UpdatePasswordResponse(
      status: json['status'] as bool?,
      message: json['message'] == null
          ? null
          : Name.fromJson(json['message'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UpdatePasswordResponseToJson(
        UpdatePasswordResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };
