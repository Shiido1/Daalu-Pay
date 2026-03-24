import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  String? accountNumber;
  String? userId;
  String? bankName;
  String? accountName;
  DateTime? updatedAt;
  DateTime? createdAt;
  num? id;

  Data({
    this.accountNumber,
    this.userId,
    this.bankName,
    this.accountName,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
