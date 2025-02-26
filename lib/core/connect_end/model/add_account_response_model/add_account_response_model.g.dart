// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_account_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddAccountResponseModel _$AddAccountResponseModelFromJson(
        Map<String, dynamic> json) =>
    AddAccountResponseModel(
      status: json['status'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddAccountResponseModelToJson(
        AddAccountResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
