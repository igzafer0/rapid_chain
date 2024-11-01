// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentDto _$CommentDtoFromJson(Map<String, dynamic> json) => CommentDto(
      id: (json['id'] as num?)?.toInt(),
      content: json['content'] as String?,
      parentId: (json['parentId'] as num?)?.toInt(),
      createdDate: json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
      user: json['user'] == null
          ? null
          : CommentUserDto.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CommentDtoToJson(CommentDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'parentId': instance.parentId,
      'createdDate': instance.createdDate?.toIso8601String(),
      'user': instance.user,
    };

CommentUserDto _$CommentUserDtoFromJson(Map<String, dynamic> json) =>
    CommentUserDto(
      userName: json['userName'] as String?,
      profilePicture: json['profilePicture'] == null
          ? null
          : MediaDto.fromJson(json['profilePicture'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CommentUserDtoToJson(CommentUserDto instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'profilePicture': instance.profilePicture,
    };
