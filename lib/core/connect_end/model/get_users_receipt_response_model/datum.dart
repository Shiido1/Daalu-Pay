import 'package:json_annotation/json_annotation.dart';

part 'datum.g.dart';

@JsonSerializable()
class Datum {
  num? id;
  num? userId;
  String? amount;
  String? receipt;
  num? adminId;
  String? status;
  dynamic notes;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic walletId;
  String? url;

  Datum({
    this.id,
    this.userId,
    this.amount,
    this.receipt,
    this.adminId,
    this.status,
    this.notes,
    this.createdAt,
    this.updatedAt,
    this.walletId,
    this.url,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);
}
