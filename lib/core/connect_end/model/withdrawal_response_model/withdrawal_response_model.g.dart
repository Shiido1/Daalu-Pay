// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'withdrawal_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WithdrawalResponseModel _$WithdrawalResponseModelFromJson(
        Map<String, dynamic> json) =>
    WithdrawalResponseModel(
      status: json['status'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WithdrawalResponseModelToJson(
        WithdrawalResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
