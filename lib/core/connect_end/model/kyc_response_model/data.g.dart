// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      userId: json['userId'] as String?,
      documentType: json['documentType'] as String?,
      documentImage: json['documentImage'] as List<dynamic>?,
      documentNumber: json['documentNumber'] as String?,
      adminId: json['adminId'] as num?,
      status: json['status'] as String?,
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      id: json['id'] as num?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'userId': instance.userId,
      'documentType': instance.documentType,
      'documentImage': instance.documentImage,
      'documentNumber': instance.documentNumber,
      'adminId': instance.adminId,
      'status': instance.status,
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'createdAt': instance.createdAt?.toIso8601String(),
      'id': instance.id,
    };
