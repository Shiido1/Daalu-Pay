// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      userId: json['userId'] as dynamic,
      notifyEmail: json['notifyEmail'] as String?,
      notifySms: json['notifySms'] as String?,
      theme: json['theme'] as String?,
      dailyTransactionLimit: json['dailyTransactionLimit'] as String?,
      transactionTotalToday: json['transactionTotalToday'] as dynamic,
      twoFaEnabled: json['twoFaEnabled'] as String?,
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      id: json['id'] as dynamic,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'userId': instance.userId,
      'notifyEmail': instance.notifyEmail,
      'notifySms': instance.notifySms,
      'theme': instance.theme,
      'dailyTransactionLimit': instance.dailyTransactionLimit,
      'transactionTotalToday': instance.transactionTotalToday,
      'twoFaEnabled': instance.twoFaEnabled,
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'createdAt': instance.createdAt?.toIso8601String(),
      'id': instance.id,
    };
