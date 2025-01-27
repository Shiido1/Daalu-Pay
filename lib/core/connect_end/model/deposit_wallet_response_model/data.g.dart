// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      userId: json['userId'] as String?,
      amount: json['amount'] as String?,
      channel: json['channel'] as String?,
      transactionId: json['transactionId'] as num?,
      id: json['id'] as num?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'userId': instance.userId,
      'amount': instance.amount,
      'channel': instance.channel,
      'transactionId': instance.transactionId,
      'id': instance.id,
    };
