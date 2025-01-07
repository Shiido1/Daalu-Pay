import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  String? uuid;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  DateTime? updatedAt;
  DateTime? createdAt;
  String? id;

  Data({
    this.uuid,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
