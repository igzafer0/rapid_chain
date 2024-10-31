// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reference_leader_board_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReferenceLeaderBoardDto _$ReferenceLeaderBoardDtoFromJson(
        Map<String, dynamic> json) =>
    ReferenceLeaderBoardDto(
      userReference: (json['userReference'] as num?)?.toInt(),
      userRank: (json['userRank'] as num?)?.toInt(),
      totalParticipants: (json['totalParticipants'] as num?)?.toInt(),
      references: (json['references'] as List<dynamic>?)
          ?.map((e) =>
              ReferenceLeaderBoardUserDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ReferenceLeaderBoardDtoToJson(
        ReferenceLeaderBoardDto instance) =>
    <String, dynamic>{
      'userRank': instance.userRank,
      'userReference': instance.userReference,
      'totalParticipants': instance.totalParticipants,
      'references': instance.references,
    };

ReferenceLeaderBoardUserDto _$ReferenceLeaderBoardUserDtoFromJson(
        Map<String, dynamic> json) =>
    ReferenceLeaderBoardUserDto(
      profilePicture: json['profilePicture'] == null
          ? null
          : MediaDto.fromJson(json['profilePicture'] as Map<String, dynamic>),
      name: json['name'] as String?,
      reference: (json['reference'] as num?)?.toInt(),
      rank: (json['rank'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ReferenceLeaderBoardUserDtoToJson(
        ReferenceLeaderBoardUserDto instance) =>
    <String, dynamic>{
      'profilePicture': instance.profilePicture,
      'name': instance.name,
      'reference': instance.reference,
      'rank': instance.rank,
    };
