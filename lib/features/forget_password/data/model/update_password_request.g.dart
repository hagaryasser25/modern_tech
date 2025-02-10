// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_password_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdatePasswordRequest _$UpdatePasswordRequestFromJson(
        Map<String, dynamic> json) =>
    UpdatePasswordRequest(
      token: json['token'] as String?,
      newPassword: json['new_password'] as String?,
      newPasswordConfirmation: json['new_password_confirmation'] as String?,
    );

Map<String, dynamic> _$UpdatePasswordRequestToJson(
        UpdatePasswordRequest instance) =>
    <String, dynamic>{
      'token': instance.token,
      'new_password': instance.newPassword,
      'new_password_confirmation': instance.newPasswordConfirmation,
    };
