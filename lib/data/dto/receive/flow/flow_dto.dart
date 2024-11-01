import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:rapid_chain/data/dto/receive/flow/comment_dto.dart';
import 'package:rapid_chain/data/dto/receive/media/media_dto.dart';
import 'package:rapid_chain/domain/entity/flow/flow_entity.dart';

part 'flow_dto.g.dart';

@JsonSerializable()
class FlowDto {
  int? id;
  String? content;
  MediaDto? mediaItem;
  bool? isLiked;
  List<CommentDto>? comments;
  CommentUserDto? user;
  DateTime? createdDate;

  int? likeCount;
  FlowDto({
    this.id,
    this.content,
    this.mediaItem,
    this.isLiked,
    this.likeCount,
    this.comments,
    this.user,
    this.createdDate,
  });

  factory FlowDto.fromJson(Map<String, dynamic> json) =>
      _$FlowDtoFromJson(json);

  Map<String, dynamic> toJson() => _$FlowDtoToJson(this);

  FlowEntity toEntity() => FlowEntity(
      id: id ?? 0,
      createdDate: createdDate != null
          ? DateFormat("yyyy-MM-dd HH:mm:ss")
              .parse(createdDate.toString(), true)
              .toLocal()
          : DateTime.now(),
      user: user != null ? user!.toEntity() : CommentUserDto().toEntity(),
      content: content ?? "",
      mediaItem:
          mediaItem != null ? mediaItem!.toEntity() : MediaDto().toEntity(),
      isLiked: isLiked ?? false,
      likeCount: likeCount ?? 0,
      comments:
          comments != null ? comments!.map((e) => e.toEntity()).toList() : []);
}
