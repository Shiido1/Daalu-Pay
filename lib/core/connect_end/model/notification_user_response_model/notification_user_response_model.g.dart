// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_user_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationUserResponseModel _$NotificationUserResponseModelFromJson(
        Map<String, dynamic> json) =>
    NotificationUserResponseModel(
      status: json['status'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NotificationUserResponseModelToJson(
        NotificationUserResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
