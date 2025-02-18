// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datum.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
      id: json['id'] as num?,
      userId: json['userId'] as num?,
      amount: json['amount'] as String?,
      status: json['status'] as String?,
      recipientAlipayId: json['recipientAlipayId'] as String?,
      transactionId: json['transactionId'] as num?,
      documentType: json['documentType'] as String?,
      proofOfPayment: json['proofOfPayment'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'amount': instance.amount,
      'status': instance.status,
      'recipientAlipayId': instance.recipientAlipayId,
      'transactionId': instance.transactionId,
      'documentType': instance.documentType,
      'proofOfPayment': instance.proofOfPayment,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
