// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datum.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
      id: json['id'] as num?,
      userId: json['userId'] as num?,
      adminId: json['adminId'] as num?,
      amount: json['amount'] as num?,
      currency: json['currency'] as String?,
      status: json['status'] as String?,
      paymentDetails: json['paymentDetails'] as String?,
      recipientName: json['recipientName'] as String?,
      recipientEmail: json['recipientEmail'] as String?,
      description: json['description'] as String?,
      transactionId: json['transactionId'] as num?,
      documentType: json['documentType'] as String?,
      proofOfPayment: json['proofOfPayment'] as String?,
      qrCode: json['qrCode'],
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
      'adminId': instance.adminId,
      'amount': instance.amount,
      'currency': instance.currency,
      'status': instance.status,
      'paymentDetails': instance.paymentDetails,
      'recipientName': instance.recipientName,
      'recipientEmail': instance.recipientEmail,
      'description': instance.description,
      'transactionId': instance.transactionId,
      'documentType': instance.documentType,
      'proofOfPayment': instance.proofOfPayment,
      'qrCode': instance.qrCode,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
