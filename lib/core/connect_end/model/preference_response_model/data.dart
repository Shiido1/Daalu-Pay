import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  dynamic userId;
  String? notifyEmail;
  String? notifySms;
  String? theme;
  String? dailyTransactionLimit;
  dynamic transactionTotalToday;
  String? twoFaEnabled;
  DateTime? updatedAt;
  DateTime? createdAt;
  dynamic id;

  Data({
    this.userId,
    this.notifyEmail,
    this.notifySms,
    this.theme,
    this.dailyTransactionLimit,
    this.transactionTotalToday,
    this.twoFaEnabled,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
