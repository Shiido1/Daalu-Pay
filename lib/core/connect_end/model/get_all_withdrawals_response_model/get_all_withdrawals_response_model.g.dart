// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_withdrawals_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllWithdrawalsResponseModel _$GetAllWithdrawalsResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetAllWithdrawalsResponseModel(
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAllWithdrawalsResponseModelToJson(
        GetAllWithdrawalsResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
