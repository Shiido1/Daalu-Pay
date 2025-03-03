import 'package:json_annotation/json_annotation.dart';

part 'datum.g.dart';

@JsonSerializable()
class Datum {
  num? id;
  String? fromCurrency;
  String? toCurrency;
  String? rate;
  String? createdAt;
  String? updatedAt;

  Datum({
    this.id,
    this.fromCurrency,
    this.toCurrency,
    this.rate,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);
}
