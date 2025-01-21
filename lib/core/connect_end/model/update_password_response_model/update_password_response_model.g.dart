// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_password_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdatePasswordResponseModel _$UpdatePasswordResponseModelFromJson(
        Map<String, dynamic> json) =>
    UpdatePasswordResponseModel(
      status: json['status'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UpdatePasswordResponseModelToJson(
        UpdatePasswordResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
