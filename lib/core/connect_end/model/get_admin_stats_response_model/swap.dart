import 'package:json_annotation/json_annotation.dart';

import 'user.dart';

part 'swap.g.dart';

@JsonSerializable()
class Swap {
  num? id;
  String? uuid;
  num? userId;
  num? adminId;
  num? transactionId;
  String? fromCurrency;
  String? toCurrency;
  num? fromAmount;
  num? toAmount;
  String? rate;
  String? status;
  dynamic notes;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;
  User? user;

  Swap({
    this.id,
    this.uuid,
    this.userId,
    this.adminId,
    this.transactionId,
    this.fromCurrency,
    this.toCurrency,
    this.fromAmount,
    this.toAmount,
    this.rate,
    this.status,
    this.notes,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.user,
  });

  factory Swap.fromJson(Map<String, dynamic> json) => _$SwapFromJson(json);

  Map<String, dynamic> toJson() => _$SwapToJson(this);
}
