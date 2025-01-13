// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_admin_stats_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAdminStatsResponseModel _$GetAdminStatsResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetAdminStatsResponseModel(
      status: json['status'] as bool?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$GetAdminStatsResponseModelToJson(
        GetAdminStatsResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
      'message': instance.message,
    };
