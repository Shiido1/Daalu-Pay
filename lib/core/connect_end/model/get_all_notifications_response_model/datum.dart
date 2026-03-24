import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'datum.g.dart';

@JsonSerializable()
class Datum {
  String? id;
  String? type;
  String? notifiableType;
  num? notifiableId;
  Data? data;
  dynamic readAt;
  DateTime? createdAt;
  DateTime? updatedAt;

  Datum({
    this.id,
    this.type,
    this.notifiableType,
    this.notifiableId,
    this.data,
    this.readAt,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);
}
