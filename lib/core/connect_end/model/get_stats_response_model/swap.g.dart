// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'swap.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Swap _$SwapFromJson(Map<String, dynamic> json) => Swap(
      id: json['id'] as num?,
      uuid: json['uuid'] as String?,
      userId: json['userId'] as num?,
      adminId: json['adminId'] as num?,
      transactionId: json['transactionId'] as num?,
      fromCurrency: json['fromCurrency'] as String?,
      toCurrency: json['toCurrency'] as String?,
      fromAmount: json['fromAmount'],
      toAmount: json['toAmount'],
      rate: json['rate'] as String?,
      status: json['status'] as String?,
      notes: json['notes'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      deletedAt: json['deletedAt'],
    );

Map<String, dynamic> _$SwapToJson(Swap instance) => <String, dynamic>{
      'id': instance.id,
      'uuid': instance.uuid,
      'userId': instance.userId,
      'adminId': instance.adminId,
      'transactionId': instance.transactionId,
      'fromCurrency': instance.fromCurrency,
      'toCurrency': instance.toCurrency,
      'fromAmount': instance.fromAmount,
      'toAmount': instance.toAmount,
      'rate': instance.rate,
      'status': instance.status,
      'notes': instance.notes,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'deletedAt': instance.deletedAt,
    };
