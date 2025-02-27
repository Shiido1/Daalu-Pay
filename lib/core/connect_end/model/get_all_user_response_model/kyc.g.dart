// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kyc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Kyc _$KycFromJson(Map<String, dynamic> json) => Kyc(
      id: json['id'] as num?,
      userId: json['userId'] as num?,
      adminId: json['adminId'] as num?,
      status: json['status'] as String?,
      reason: json['reason'],
      type: json['type'] as String?,
      documentType: json['documentType'] as String?,
      documentNumber: json['documentNumber'] as String?,
      documentImage: json['documentImage'] as String?,
      passportPhoto: json['passportPhoto'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      deletedAt: json['deletedAt'],
    );

Map<String, dynamic> _$KycToJson(Kyc instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'adminId': instance.adminId,
      'status': instance.status,
      'reason': instance.reason,
      'type': instance.type,
      'documentType': instance.documentType,
      'documentNumber': instance.documentNumber,
      'documentImage': instance.documentImage,
      'passportPhoto': instance.passportPhoto,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'deletedAt': instance.deletedAt,
    };
