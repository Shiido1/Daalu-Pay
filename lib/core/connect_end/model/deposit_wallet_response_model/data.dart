import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  String? userId;
  String? amount;
  String? channel;
  num? transactionId;
  num? id;

  Data({
    this.userId,
    this.amount,
    this.channel,
    this.transactionId,
    this.id,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
