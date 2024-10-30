// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'campaign_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CampaignDto _$CampaignDtoFromJson(Map<String, dynamic> json) => CampaignDto(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      startDate: json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
      isCollected: json['isCollected'] as bool?,
    );

Map<String, dynamic> _$CampaignDtoToJson(CampaignDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'startDate': instance.startDate?.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
      'isCollected': instance.isCollected,
    };
