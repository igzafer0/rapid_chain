import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:rapid_chain/domain/entity/campaign/campaign_entity.dart';

part 'campaign_dto.g.dart';

@JsonSerializable()
class CampaignDto {
  int? id;
  String? title;
  DateTime? startDate;
  DateTime? endDate;
  bool? isCollected;

  CampaignDto(
      {this.id, this.title, this.startDate, this.endDate, this.isCollected});

  factory CampaignDto.fromJson(Map<String, dynamic> json) =>
      _$CampaignDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CampaignDtoToJson(this);

  CampaignEntity toEntity() => CampaignEntity(
      id: id ?? 0,
      title: title ?? "",
      startDate: startDate != null
          ? DateFormat("yyyy-MM-dd HH:mm:ss")
              .parse(startDate.toString(), true)
              .toLocal()
          : DateTime.now(),
      endDate: startDate != null
          ? DateFormat("yyyy-MM-dd HH:mm:ss")
              .parse(endDate.toString(), true)
              .toLocal()
          : DateTime.now(),
      isCollected: isCollected ?? false);
}
