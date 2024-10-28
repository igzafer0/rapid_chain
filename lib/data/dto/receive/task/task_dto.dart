import 'package:json_annotation/json_annotation.dart';
import 'package:rapid_chain/data/dto/receive/media/media_dto.dart';
import 'package:rapid_chain/domain/entity/task/task_entity.dart';

part 'task_dto.g.dart';

@JsonSerializable()
class TaskDto {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "point")
  int? point;
  @JsonKey(name: "url")
  String? url;
  @JsonKey(name: "isCollected")
  bool? isCollected;
  @JsonKey(name: "coverImage")
  MediaDto? coverImage;

  TaskDto(
      {this.id,
      this.title,
      this.point,
      this.url,
      this.isCollected,
      this.coverImage});

  factory TaskDto.fromJson(Map<String, dynamic> json) =>
      _$TaskDtoFromJson(json);

  Map<String, dynamic> toJson() => _$TaskDtoToJson(this);
  TaskEntity toEntity() => TaskEntity(
      id: id ?? 0,
      title: title ?? "",
      point: point ?? 0,
      url: url ?? "",
      collected: isCollected ?? false,
      cover:
          coverImage != null ? coverImage!.toEntity() : MediaDto().toEntity());
}
