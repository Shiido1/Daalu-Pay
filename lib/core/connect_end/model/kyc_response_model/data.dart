import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  String? userId;
  String? documentType;
  List<dynamic>? documentImage;
  String? documentNumber;
  num? adminId;
  String? status;
  DateTime? updatedAt;
  DateTime? createdAt;
  num? id;

  Data({
    this.userId,
    this.documentType,
    this.documentImage,
    this.documentNumber,
    this.adminId,
    this.status,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
