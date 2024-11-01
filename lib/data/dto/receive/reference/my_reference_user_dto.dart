import 'package:json_annotation/json_annotation.dart';
import 'package:rapid_chain/data/dto/receive/media/media_dto.dart';
import 'package:rapid_chain/domain/entity/reference/my_reference_user_entity.dart';
part 'my_reference_user_dto.g.dart';

@JsonSerializable()
class MyReferenceUserDto {
  String? userName;
  MediaDto? profilePicture;
  MyReferenceUserDto({this.userName, this.profilePicture});
  factory MyReferenceUserDto.fromJson(Map<String, dynamic> json) =>
      _$MyReferenceUserDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MyReferenceUserDtoToJson(this);

  MyReferenceUserEntity toEntity() => MyReferenceUserEntity(
      userName: userName ?? "",
      profilePicture: profilePicture != null
          ? profilePicture!.toEntity()
          : MediaDto().toEntity());
}
