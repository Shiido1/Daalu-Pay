import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  String? chatId;
  String? senderId;
  String? sentFrom;
  String? message;
  DateTime? updatedAt;
  DateTime? createdAt;
  num? id;

  Data({
    this.chatId,
    this.senderId,
    this.sentFrom,
    this.message,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
