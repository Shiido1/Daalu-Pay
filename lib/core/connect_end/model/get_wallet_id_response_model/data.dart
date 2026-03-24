import 'package:json_annotation/json_annotation.dart';

import 'user.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  num? id;
  String? uuid;
  num? userId;
  num? currencyId;
  num? balance;
  dynamic deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  User? user;
  String? currency;

  Data({
    this.id,
    this.uuid,
    this.userId,
    this.currencyId,
    this.balance,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.user,
    this.currency,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
