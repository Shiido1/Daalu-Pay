import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  String? userId;
  dynamic amount;
  num? currencyId;
  num? walletId;
  num? transactionId;
  num? bankId;
  String? bankName;
  String? accountNumber;
  String? proofOfPayment;
  String? reference;
  String? status;
  num? adminId;
  DateTime? updatedAt;
  DateTime? createdAt;
  num? id;

  Data({
    this.userId,
    this.amount,
    this.currencyId,
    this.walletId,
    this.transactionId,
    this.bankId,
    this.bankName,
    this.accountNumber,
    this.proofOfPayment,
    this.reference,
    this.status,
    this.adminId,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
