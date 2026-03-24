// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_exchange_rates_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllExchangeRatesResponseModel _$AllExchangeRatesResponseModelFromJson(
        Map<String, dynamic> json) =>
    AllExchangeRatesResponseModel(
      status: json['status'] as bool?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$AllExchangeRatesResponseModelToJson(
        AllExchangeRatesResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
      'message': instance.message,
    };
