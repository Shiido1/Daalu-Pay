// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_exchange_rate_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetExchangeRateResponseModel _$GetExchangeRateResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetExchangeRateResponseModel(
      status: json['status'] as bool?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$GetExchangeRateResponseModelToJson(
        GetExchangeRateResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
      'message': instance.message,
    };
