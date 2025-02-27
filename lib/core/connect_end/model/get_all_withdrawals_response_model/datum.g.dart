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
      currencyId: json['currencyId'] as num?,
      walletId: json['walletId'] as num?,
      transactionId: json['transactionId'] as String?,
      bankId: json['bankId'] as num?,
      bankName: json['bankName'] as String?,
      accountNumber: json['accountNumber'] as String?,
      accountName: json['accountName'],
      reference: json['reference'] as String?,
      proofOfPayment: json['proofOfPayment'] as String?,
      note: json['note'],
      adminId: json['adminId'] as num?,
      approvedAt: json['approvedAt'],
      declinedAt: json['declinedAt'],
      processedAt: json['processedAt'],
      cancelledAt: json['cancelledAt'],
      completedAt: json['completedAt'],
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
      'currencyId': instance.currencyId,
      'walletId': instance.walletId,
      'transactionId': instance.transactionId,
      'bankId': instance.bankId,
      'bankName': instance.bankName,
      'accountNumber': instance.accountNumber,
      'accountName': instance.accountName,
      'reference': instance.reference,
      'proofOfPayment': instance.proofOfPayment,
      'note': instance.note,
      'adminId': instance.adminId,
      'approvedAt': instance.approvedAt,
      'declinedAt': instance.declinedAt,
      'processedAt': instance.processedAt,
      'cancelledAt': instance.cancelledAt,
      'completedAt': instance.completedAt,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
