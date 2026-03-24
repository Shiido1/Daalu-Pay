// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'withdrawal_history_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WithdrawalHistoryResponseModel _$WithdrawalHistoryResponseModelFromJson(
        Map<String, dynamic> json) =>
    WithdrawalHistoryResponseModel(
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WithdrawalHistoryResponseModelToJson(
        WithdrawalHistoryResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
