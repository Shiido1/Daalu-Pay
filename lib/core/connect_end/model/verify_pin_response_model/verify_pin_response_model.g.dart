// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_pin_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyPinResponseModel _$VerifyPinResponseModelFromJson(
        Map<String, dynamic> json) =>
    VerifyPinResponseModel(
      status: json['status'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VerifyPinResponseModelToJson(
        VerifyPinResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
