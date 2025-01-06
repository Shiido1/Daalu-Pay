// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datum.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
      uuid: json['uuid'] as String?,
      userId: json['userId'] as num?,
      referenceNumber: json['referenceNumber'] as String?,
      channel: json['channel'] as String?,
      type: json['type'] as String?,
      amount: json['amount'] as String?,
      status: json['status'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
      'uuid': instance.uuid,
      'userId': instance.userId,
      'referenceNumber': instance.referenceNumber,
      'channel': instance.channel,
      'type': instance.type,
      'amount': instance.amount,
      'status': instance.status,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
