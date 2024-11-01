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
      likeCount: (json['likeCount'] as num?)?.toInt(),
      comments: (json['comments'] as List<dynamic>?)
          ?.map((e) => CommentDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      user: json['user'] == null
          ? null
          : CommentUserDto.fromJson(json['user'] as Map<String, dynamic>),
      createdDate: json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
    );

Map<String, dynamic> _$FlowDtoToJson(FlowDto instance) => <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'mediaItem': instance.mediaItem,
      'isLiked': instance.isLiked,
      'comments': instance.comments,
      'user': instance.user,
      'createdDate': instance.createdDate?.toIso8601String(),
      'likeCount': instance.likeCount,
    };
