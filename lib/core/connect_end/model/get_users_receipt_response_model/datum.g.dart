// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datum.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
      id: json['id'] as num?,
      userId: json['userId'] as num?,
      amount: json['amount'] as String?,
      receipt: json['receipt'] as String?,
      adminId: json['adminId'] as num?,
      status: json['status'] as String?,
      notes: json['notes'],
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      walletId: json['walletId'],
      url: json['url'] as String?,
    );

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'amount': instance.amount,
      'receipt': instance.receipt,
      'adminId': instance.adminId,
      'status': instance.status,
      'notes': instance.notes,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'walletId': instance.walletId,
      'url': instance.url,
    };
