// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'initiate_chat_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InitiateChatResponseModel _$InitiateChatResponseModelFromJson(
        Map<String, dynamic> json) =>
    InitiateChatResponseModel(
      status: json['status'] as bool?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$InitiateChatResponseModelToJson(
        InitiateChatResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
      'message': instance.message,
    };
