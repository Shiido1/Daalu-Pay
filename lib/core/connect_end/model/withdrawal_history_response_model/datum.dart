import 'package:json_annotation/json_annotation.dart';

part 'datum.g.dart';

@JsonSerializable()
class Datum {
  num? id;
  num? userId;
  dynamic amount;
  String? status;
  num? currencyId;
  num? walletId;
  String? transactionId;
  num? bankId;
  String? bankName;
  String? accountNumber;
  dynamic accountName;
  String? reference;
  String? proofOfPayment;
  dynamic note;
  num? adminId;
  dynamic approvedAt;
  dynamic declinedAt;
  dynamic processedAt;
  dynamic cancelledAt;
  dynamic completedAt;
  DateTime? createdAt;
  DateTime? updatedAt;

  Datum({
    this.id,
    this.userId,
    this.amount,
    this.status,
    this.currencyId,
    this.walletId,
    this.transactionId,
    this.bankId,
    this.bankName,
    this.accountNumber,
    this.accountName,
    this.reference,
    this.proofOfPayment,
    this.note,
    this.adminId,
    this.approvedAt,
    this.declinedAt,
    this.processedAt,
    this.cancelledAt,
    this.completedAt,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);
}
