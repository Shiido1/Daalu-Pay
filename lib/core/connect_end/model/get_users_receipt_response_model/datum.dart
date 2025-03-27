import 'package:json_annotation/json_annotation.dart';

part 'datum.g.dart';

@JsonSerializable()
class Datum {
  num? id;
  num? userId;
  num? adminId;
  num? amount;
  String? currency;
  String? status;
  String? paymentDetails;
  String? recipientName;
  String? recipientEmail;
  String? description;
  num? transactionId;
  String? documentType;
  String? proofOfPayment;
  dynamic qrCode;
  DateTime? createdAt;
  DateTime? updatedAt;

  Datum({
    this.id,
    this.userId,
    this.adminId,
    this.amount,
    this.currency,
    this.status,
    this.paymentDetails,
    this.recipientName,
    this.recipientEmail,
    this.description,
    this.transactionId,
    this.documentType,
    this.proofOfPayment,
    this.qrCode,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);
}
