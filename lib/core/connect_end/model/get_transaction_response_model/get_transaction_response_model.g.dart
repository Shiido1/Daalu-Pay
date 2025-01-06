// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_transaction_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetTransactionResponseModel _$GetTransactionResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetTransactionResponseModel(
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetTransactionResponseModelToJson(
        GetTransactionResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
