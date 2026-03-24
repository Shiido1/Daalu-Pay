import 'package:json_annotation/json_annotation.dart';

part 'update_password_entity.g.dart';

@JsonSerializable()
class UpdatePasswordEntity {
  @JsonKey(name: 'old_password')
  String? oldPassword;
  @JsonKey(name: 'new_password')
  String? newPassword;

  UpdatePasswordEntity({this.oldPassword, this.newPassword});

  factory UpdatePasswordEntity.fromJson(Map<String, dynamic> json) {
    return _$UpdatePasswordEntityFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UpdatePasswordEntityToJson(this);
}
