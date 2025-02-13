// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preference_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PreferenceResponseModel _$PreferenceResponseModelFromJson(
        Map<String, dynamic> json) =>
    PreferenceResponseModel(
      status: json['status'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PreferenceResponseModelToJson(
        PreferenceResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
