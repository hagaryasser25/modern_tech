// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_body_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterBodyResponse _$RegisterBodyResponseFromJson(
        Map<String, dynamic> json) =>
    RegisterBodyResponse(
      status: json['status'] as bool?,
      message: json['message'] == null
          ? null
          : Name.fromJson(json['message'] as Map<String, dynamic>),
      authToken: json['authToken'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RegisterBodyResponseToJson(
        RegisterBodyResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'authToken': instance.authToken,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'email': instance.email,
    };
