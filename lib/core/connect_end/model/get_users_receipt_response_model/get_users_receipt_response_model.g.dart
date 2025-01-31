// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_users_receipt_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetUsersReceiptResponseModel _$GetUsersReceiptResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetUsersReceiptResponseModel(
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetUsersReceiptResponseModelToJson(
        GetUsersReceiptResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
