import 'package:json_annotation/json_annotation.dart';

import 'swap.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  List<Swap>? swaps;

  Data({this.swaps});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
