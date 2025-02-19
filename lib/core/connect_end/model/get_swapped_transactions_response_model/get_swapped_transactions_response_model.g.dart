// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_swapped_transactions_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetSwappedTransactionsResponseModel
    _$GetSwappedTransactionsResponseModelFromJson(Map<String, dynamic> json) =>
        GetSwappedTransactionsResponseModel(
          status: json['status'] as String?,
          data: (json['data'] as List<dynamic>?)
              ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
              .toList(),
        );

Map<String, dynamic> _$GetSwappedTransactionsResponseModelToJson(
        GetSwappedTransactionsResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
