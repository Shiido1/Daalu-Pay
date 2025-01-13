import 'package:json_annotation/json_annotation.dart';

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
  String? fromAmount;
  String? toAmount;
  String? rate;
  String? status;
  String? notes;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;

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
  });

  factory Swap.fromJson(Map<String, dynamic> json) => _$SwapFromJson(json);

  Map<String, dynamic> toJson() => _$SwapToJson(this);
}
