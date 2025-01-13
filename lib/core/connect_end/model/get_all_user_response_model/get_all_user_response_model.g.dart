// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_user_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllUserResponseModel _$GetAllUserResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetAllUserResponseModel(
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAllUserResponseModelToJson(
        GetAllUserResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
