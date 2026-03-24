// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_payment_gate_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetPaymentGateResponseModel _$GetPaymentGateResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetPaymentGateResponseModel(
      status: json['status'] as bool?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$GetPaymentGateResponseModelToJson(
        GetPaymentGateResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
      'message': instance.message,
    };
