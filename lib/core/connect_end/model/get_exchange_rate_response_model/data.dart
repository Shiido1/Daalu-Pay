import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  num? id;
  String? fromCurrency;
  String? toCurrency;
  String? rate;
  String? createdAt;
  String? updatedAt;

  Data({
    this.id,
    this.fromCurrency,
    this.toCurrency,
    this.rate,
    this.createdAt,
    this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
