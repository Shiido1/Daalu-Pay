// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_a_notification_message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetANotificationMessageModel _$GetANotificationMessageModelFromJson(
        Map<String, dynamic> json) =>
    GetANotificationMessageModel(
      status: json['status'] as String?,
      datum: json['data'] == null
          ? null
          : Datum.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetANotificationMessageModelToJson(
        GetANotificationMessageModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.datum,
    };
