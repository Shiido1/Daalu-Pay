// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_notifications_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllNotificationsResponseModel _$GetAllNotificationsResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetAllNotificationsResponseModel(
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAllNotificationsResponseModelToJson(
        GetAllNotificationsResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
