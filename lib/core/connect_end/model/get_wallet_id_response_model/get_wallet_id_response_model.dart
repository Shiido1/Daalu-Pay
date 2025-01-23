import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'get_wallet_id_response_model.g.dart';

@JsonSerializable()
class GetWalletIdResponseModel {
  String? status;
  Data? data;

  GetWalletIdResponseModel({this.status, this.data});

  factory GetWalletIdResponseModel.fromJson(Map<String, dynamic> json) {
    return _$GetWalletIdResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetWalletIdResponseModelToJson(this);
}
