import 'package:json_annotation/json_annotation.dart';

part 'datum.g.dart';

@JsonSerializable()
class Datum {
  num? id;
  num? userId;
  String? amount;
  String? status;
  String? recipientAlipayId;
  num? transactionId;
  String? documentType;
  String? proofOfPayment;
  DateTime? createdAt;
  DateTime? updatedAt;

  Datum({
    this.id,
    this.userId,
    this.amount,
    this.status,
    this.recipientAlipayId,
    this.transactionId,
    this.documentType,
    this.proofOfPayment,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);
}
