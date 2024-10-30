import 'package:json_annotation/json_annotation.dart';
import 'package:rapid_chain/domain/entity/app_info/app_info_entity.dart';
part 'app_info_dto.g.dart';

@JsonSerializable()
class AppInfoDto {
  String? content;

  AppInfoDto({this.content});
  factory AppInfoDto.fromJson(Map<String, dynamic> json) =>
      _$AppInfoDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AppInfoDtoToJson(this);

  AppInfoEntity toEntity() =>
      AppInfoEntity(content: content ?? "<h1> Bir sorun oluştu!</h1>");
}
