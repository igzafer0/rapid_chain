// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskDto _$TaskDtoFromJson(Map<String, dynamic> json) => TaskDto(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      point: (json['point'] as num?)?.toInt(),
      url: json['url'] as String?,
      isCollected: json['isCollected'] as bool?,
      coverImage: json['coverImage'] == null
          ? null
          : MediaDto.fromJson(json['coverImage'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TaskDtoToJson(TaskDto instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'point': instance.point,
      'url': instance.url,
      'isCollected': instance.isCollected,
      'coverImage': instance.coverImage,
    };
