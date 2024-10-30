import 'package:json_annotation/json_annotation.dart';
import 'package:rapid_chain/data/dto/receive/media/media_dto.dart';
import 'package:rapid_chain/domain/entity/user/user_entity.dart';

part 'user_dto.g.dart';

@JsonSerializable()
class UserDto {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "surname")
  String? surname;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "walletaddress")
  String? walletAddress;
  @JsonKey(name: "referenceCode")
  String? referenceCode;
  @JsonKey(name: "profileImage")
  MediaDto? profileImage;

  UserDto({
    this.id,
    this.name,
    this.email,
    this.profileImage,
    this.referenceCode,
    this.surname,
    this.walletAddress,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserDtoToJson(this);

  UserEntity toEntity() => UserEntity(
        id: id ?? 0,
        name: name ?? "",
        email: email ?? "",
        profileImage: profileImage != null
            ? profileImage!.toEntity()
            : MediaDto().toEntity(),
        referenceCode: referenceCode ?? "",
        surname: surname ?? "",
        walletAddress: walletAddress ?? "",
      );
}
