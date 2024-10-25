import 'package:json_annotation/json_annotation.dart';

part 'reset_password_token_model.g.dart';

@JsonSerializable()
class ResetPasswordTokenModel {
  @JsonKey(name: "token")
  String? token;

  ResetPasswordTokenModel({
    this.token,
  });

  factory ResetPasswordTokenModel.fromJson(Map<String, dynamic> json) => _$ResetPasswordTokenModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResetPasswordTokenModelToJson(this);
}
