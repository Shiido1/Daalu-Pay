// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_pin_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreatePinResponseModel _$CreatePinResponseModelFromJson(
        Map<String, dynamic> json) =>
    CreatePinResponseModel(
      status: json['status'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CreatePinResponseModelToJson(
        CreatePinResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
