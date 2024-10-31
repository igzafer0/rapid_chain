import 'package:json_annotation/json_annotation.dart';
import 'package:rapid_chain/data/dto/receive/media/media_dto.dart';
import 'package:rapid_chain/domain/entity/leader_board/point_leader_board_entity.dart';
part 'point_leader_board_dto.g.dart';

@JsonSerializable()
class PointLeaderBoardDto {
  int? userRank;
  int? userPoint;
  int? totalParticipants;
  List<PointLeaderBoardUserDto>? points;
  PointLeaderBoardDto({
    this.userPoint,
    this.userRank,
    this.totalParticipants,
    this.points,
  });

  factory PointLeaderBoardDto.fromJson(Map<String, dynamic> json) =>
      _$PointLeaderBoardDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PointLeaderBoardDtoToJson(this);
  PointLeaderBoardEntity toEntity() => PointLeaderBoardEntity(
      userPoint: userPoint ?? 0,
      userRank: userRank ?? 0,
      totalParticipants: totalParticipants ?? 0,
      points: points != null ? points!.map((e) => e.toEntity()).toList() : []);
}

@JsonSerializable()
class PointLeaderBoardUserDto {
  MediaDto? profilePicture;
  String? name;
  int? point;
  int? rank;

  PointLeaderBoardUserDto({
    this.profilePicture,
    this.name,
    this.point,
    this.rank,
  });

  factory PointLeaderBoardUserDto.fromJson(Map<String, dynamic> json) =>
      _$PointLeaderBoardUserDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PointLeaderBoardUserDtoToJson(this);

  PointLeaderBoardUserEntity toEntity() => PointLeaderBoardUserEntity(
      profilePicture: profilePicture != null
          ? profilePicture!.toEntity()
          : MediaDto().toEntity(),
      name: name ?? "",
      point: point ?? 0,
      rank: rank ?? 0);
}
