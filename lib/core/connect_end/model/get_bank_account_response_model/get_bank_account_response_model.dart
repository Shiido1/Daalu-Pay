import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';

part 'get_bank_account_response_model.g.dart';

@JsonSerializable()
class GetBankAccountResponseModel {
  String? status;
  List<Datum>? data;

  GetBankAccountResponseModel({this.status, this.data});

  factory GetBankAccountResponseModel.fromJson(Map<String, dynamic> json) {
    return _$GetBankAccountResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetBankAccountResponseModelToJson(this);
}
