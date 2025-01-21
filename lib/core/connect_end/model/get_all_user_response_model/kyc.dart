import 'package:json_annotation/json_annotation.dart';

part 'kyc.g.dart';

@JsonSerializable()
class Kyc {
  num? id;
  num? userId;
  num? adminId;
  String? status;
  dynamic reason;
  String? type;
  String? documentType;
  String? documentNumber;
  String? documentImage;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;

  Kyc({
    this.id,
    this.userId,
    this.adminId,
    this.status,
    this.reason,
    this.type,
    this.documentType,
    this.documentNumber,
    this.documentImage,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory Kyc.fromJson(Map<String, dynamic> json) => _$KycFromJson(json);

  Map<String, dynamic> toJson() => _$KycToJson(this);
}
