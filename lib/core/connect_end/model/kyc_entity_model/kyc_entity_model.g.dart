// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kyc_entity_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KycEntityModel _$KycEntityModelFromJson(Map<String, dynamic> json) =>
    KycEntityModel(
      documentType: json['documentType'] as String?,
      documentFile: json['documentFile'],
      documentNumber: json['documentNumber'] as String?,
    );

Map<String, dynamic> _$KycEntityModelToJson(KycEntityModel instance) =>
    <String, dynamic>{
      'documentType': instance.documentType,
      'documentFile': instance.documentFile,
      'documentNumber': instance.documentNumber,
    };
