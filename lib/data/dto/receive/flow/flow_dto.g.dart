// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flow_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FlowDto _$FlowDtoFromJson(Map<String, dynamic> json) => FlowDto(
      id: (json['id'] as num?)?.toInt(),
      content: json['content'] as String?,
      mediaItem: json['mediaItem'] == null
          ? null
          : MediaDto.fromJson(json['mediaItem'] as Map<String, dynamic>),
      isLiked: json['isLiked'] as bool?,
    );

Map<String, dynamic> _$FlowDtoToJson(FlowDto instance) => <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'mediaItem': instance.mediaItem,
      'isLiked': instance.isLiked,
    };
