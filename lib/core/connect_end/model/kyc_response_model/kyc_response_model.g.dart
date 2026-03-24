// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kyc_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KycResponseModel _$KycResponseModelFromJson(Map<String, dynamic> json) =>
    KycResponseModel(
      status: json['status'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$KycResponseModelToJson(KycResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
