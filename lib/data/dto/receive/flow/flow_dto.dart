import 'package:json_annotation/json_annotation.dart';
import 'package:rapid_chain/data/dto/receive/media/media_dto.dart';
import 'package:rapid_chain/domain/entity/flow/flow_entity.dart';

part 'flow_dto.g.dart';

@JsonSerializable()
class FlowDto {
  int? id;
  String? content;
  MediaDto? mediaItem;
  bool? isLiked;

  FlowDto({this.id, this.content, this.mediaItem, this.isLiked});

  factory FlowDto.fromJson(Map<String, dynamic> json) =>
      _$FlowDtoFromJson(json);

  Map<String, dynamic> toJson() => _$FlowDtoToJson(this);

  FlowEntity toEntity() => FlowEntity(
        id: id ?? 0,
        content: content ?? "",
        mediaItem:
            mediaItem != null ? mediaItem!.toEntity() : MediaDto().toEntity(),
        isLiked: isLiked ?? false,
      );
}
