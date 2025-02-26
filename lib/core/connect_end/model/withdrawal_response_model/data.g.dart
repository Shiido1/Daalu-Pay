// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      userId: json['userId'] as String?,
      amount: json['amount'] as String?,
      currencyId: json['currencyId'] as num?,
      walletId: json['walletId'] as num?,
      transactionId: json['transactionId'] as num?,
      bankId: json['bankId'] as num?,
      bankName: json['bankName'] as String?,
      accountNumber: json['accountNumber'] as String?,
      proofOfPayment: json['proofOfPayment'] as String?,
      reference: json['reference'] as String?,
      status: json['status'] as String?,
      adminId: json['adminId'] as num?,
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
      'amount': instance.amount,
      'currencyId': instance.currencyId,
      'walletId': instance.walletId,
      'transactionId': instance.transactionId,
      'bankId': instance.bankId,
      'bankName': instance.bankName,
      'accountNumber': instance.accountNumber,
      'proofOfPayment': instance.proofOfPayment,
      'reference': instance.reference,
      'status': instance.status,
      'adminId': instance.adminId,
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'createdAt': instance.createdAt?.toIso8601String(),
      'id': instance.id,
    };
