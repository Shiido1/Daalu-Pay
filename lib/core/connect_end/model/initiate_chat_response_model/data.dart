import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  String? userId;
  String? status;
  num? agentId;
  DateTime? updatedAt;
  DateTime? createdAt;
  num? id;

  Data({
    this.userId,
    this.status,
    this.agentId,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
