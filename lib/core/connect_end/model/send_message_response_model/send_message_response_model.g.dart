// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_message_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendMessageResponseModel _$SendMessageResponseModelFromJson(
        Map<String, dynamic> json) =>
    SendMessageResponseModel(
      status: json['status'] as bool?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$SendMessageResponseModelToJson(
        SendMessageResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
      'message': instance.message,
    };
