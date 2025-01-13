import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  num? id;
  String? uuid;
  String? firstName;
  String? lastName;
  String? email;
  dynamic phone;
  String? role;
  String? status;
  num? transactionsAssigned;
  dynamic deletedAt;
  String? token;

  Data({
    this.id,
    this.uuid,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.role,
    this.status,
    this.transactionsAssigned,
    this.deletedAt,
    this.token,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
