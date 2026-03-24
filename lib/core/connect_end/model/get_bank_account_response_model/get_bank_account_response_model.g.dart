// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_bank_account_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetBankAccountResponseModel _$GetBankAccountResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetBankAccountResponseModel(
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetBankAccountResponseModelToJson(
        GetBankAccountResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
