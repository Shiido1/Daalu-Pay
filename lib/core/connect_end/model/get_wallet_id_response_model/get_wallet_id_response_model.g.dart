// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_wallet_id_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetWalletIdResponseModel _$GetWalletIdResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetWalletIdResponseModel(
      status: json['status'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetWalletIdResponseModelToJson(
        GetWalletIdResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
