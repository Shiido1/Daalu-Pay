import 'package:json_annotation/json_annotation.dart';

part 'datum.g.dart';

@JsonSerializable()
class Datum {
  String? uuid;
  num? userId;
  String? referenceNumber;
  String? channel;
  String? type;
  String? amount;
  String? status;
  DateTime? createdAt;

  Datum({
    this.uuid,
    this.userId,
    this.referenceNumber,
    this.channel,
    this.type,
    this.amount,
    this.status,
    this.createdAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);
}
