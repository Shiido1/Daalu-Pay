import 'package:json_annotation/json_annotation.dart';

part 'address.g.dart';

@JsonSerializable()
class Address {
  num? id;
  num? userId;
  String? town;
  String? state;
  String? country;
  DateTime? createdAt;
  DateTime? updatedAt;

  Address({
    this.id,
    this.userId,
    this.town,
    this.state,
    this.country,
    this.createdAt,
    this.updatedAt,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return _$AddressFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AddressToJson(this);
}
