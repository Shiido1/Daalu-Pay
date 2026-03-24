// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deposit_wallet_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DepositWalletResponseModel _$DepositWalletResponseModelFromJson(
        Map<String, dynamic> json) =>
    DepositWalletResponseModel(
      status: json['status'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DepositWalletResponseModelToJson(
        DepositWalletResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
