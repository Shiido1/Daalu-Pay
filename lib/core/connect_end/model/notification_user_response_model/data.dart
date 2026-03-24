import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  String? token;
  String? deviceType;
  dynamic userId;
  String? status;
  DateTime? updatedAt;
  DateTime? createdAt;
  num? id;

  Data({
    this.token,
    this.deviceType,
    this.userId,
    this.status,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
