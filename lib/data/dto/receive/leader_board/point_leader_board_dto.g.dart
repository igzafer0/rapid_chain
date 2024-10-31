// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'point_leader_board_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PointLeaderBoardDto _$PointLeaderBoardDtoFromJson(Map<String, dynamic> json) =>
    PointLeaderBoardDto(
      userPoint: (json['userPoint'] as num?)?.toInt(),
      userRank: (json['userRank'] as num?)?.toInt(),
      totalParticipants: (json['totalParticipants'] as num?)?.toInt(),
      points: (json['points'] as List<dynamic>?)
          ?.map((e) =>
              PointLeaderBoardUserDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PointLeaderBoardDtoToJson(
        PointLeaderBoardDto instance) =>
    <String, dynamic>{
      'userRank': instance.userRank,
      'userPoint': instance.userPoint,
      'totalParticipants': instance.totalParticipants,
      'points': instance.points,
    };

PointLeaderBoardUserDto _$PointLeaderBoardUserDtoFromJson(
        Map<String, dynamic> json) =>
    PointLeaderBoardUserDto(
      profilePicture: json['profilePicture'] == null
          ? null
          : MediaDto.fromJson(json['profilePicture'] as Map<String, dynamic>),
      name: json['name'] as String?,
      point: (json['point'] as num?)?.toInt(),
      rank: (json['rank'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PointLeaderBoardUserDtoToJson(
        PointLeaderBoardUserDto instance) =>
    <String, dynamic>{
      'profilePicture': instance.profilePicture,
      'name': instance.name,
      'point': instance.point,
      'rank': instance.rank,
    };
