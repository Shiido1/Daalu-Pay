// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_admin_transactions_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAdminTransactionsResponseModel _$GetAdminTransactionsResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetAdminTransactionsResponseModel(
      status: json['status'] as bool?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$GetAdminTransactionsResponseModelToJson(
        GetAdminTransactionsResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
      'message': instance.message,
    };
