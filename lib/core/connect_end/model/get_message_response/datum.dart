import 'package:json_annotation/json_annotation.dart';

part 'datum.g.dart';

@JsonSerializable()
class Datum {
  num? id;
  num? chatId;
  String? sentFrom;
  String? senderId;
  String? message;
  DateTime? createdAt;
  DateTime? updatedAt;

  Datum({
    this.id,
    this.chatId,
    this.sentFrom,
    this.senderId,
    this.message,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);
}
