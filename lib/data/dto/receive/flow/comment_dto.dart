import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:rapid_chain/data/dto/receive/media/media_dto.dart';
import 'package:rapid_chain/domain/entity/flow/comment_entity.dart';
part 'comment_dto.g.dart';

@JsonSerializable()
class CommentDto {
  int? id;
  String? content;
  int? parentId;
  DateTime? createdDate;
  CommentUserDto? user;
  CommentDto({
    this.id,
    this.content,
    this.parentId,
    this.createdDate,
    this.user,
  });

  factory CommentDto.fromJson(Map<String, dynamic> json) =>
      _$CommentDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CommentDtoToJson(this);

  CommentEntity toEntity() => CommentEntity(
      id: id ?? 0,
      content: content ?? "",
      parentId: parentId ?? -1,
      createdDate: createdDate != null
          ? DateFormat("yyyy-MM-dd HH:mm:ss")
              .parse(createdDate.toString(), true)
              .toLocal()
          : DateTime.now(),
      user: user != null ? user!.toEntity() : CommentUserDto().toEntity());
}

@JsonSerializable()
class CommentUserDto {
  String? userName;
  MediaDto? profilePicture;
  CommentUserDto({this.userName, this.profilePicture});

  factory CommentUserDto.fromJson(Map<String, dynamic> json) =>
      _$CommentUserDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CommentUserDtoToJson(this);

  CommentUserEntity toEntity() => CommentUserEntity(
      userName: userName ?? "",
      profilePicture: profilePicture != null
          ? profilePicture!.toEntity()
          : MediaDto().toEntity());
}
