// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_stats_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetStatsResponseModel _$GetStatsResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetStatsResponseModel(
      status: json['status'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetStatsResponseModelToJson(
        GetStatsResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
