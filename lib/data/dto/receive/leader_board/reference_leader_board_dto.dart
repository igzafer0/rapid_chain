import 'package:json_annotation/json_annotation.dart';
import 'package:rapid_chain/data/dto/receive/media/media_dto.dart';
import 'package:rapid_chain/domain/entity/leader_board/reference_leader_board_entity.dart';
part 'reference_leader_board_dto.g.dart';

@JsonSerializable()
class ReferenceLeaderBoardDto {
  int? userRank;
  int? userReference;
  int? totalParticipants;
  List<ReferenceLeaderBoardUserDto>? references;
  ReferenceLeaderBoardDto({
    this.userReference,
    this.userRank,
    this.totalParticipants,
    this.references,
  });

  factory ReferenceLeaderBoardDto.fromJson(Map<String, dynamic> json) =>
      _$ReferenceLeaderBoardDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ReferenceLeaderBoardDtoToJson(this);

  ReferenceLeaderBoardEntity toEntity() => ReferenceLeaderBoardEntity(
        userReference: userReference ?? 0,
        userRank: userRank ?? 0,
        totalParticipants: totalParticipants ?? 0,
        references: references != null
            ? references!.map((e) => e.toEntity()).toList()
            : [],
      );
}

@JsonSerializable()
class ReferenceLeaderBoardUserDto {
  MediaDto? profilePicture;
  String? name;
  int? reference;
  int? rank;

  ReferenceLeaderBoardUserDto({
    this.profilePicture,
    this.name,
    this.reference,
    this.rank,
  });

  factory ReferenceLeaderBoardUserDto.fromJson(Map<String, dynamic> json) =>
      _$ReferenceLeaderBoardUserDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ReferenceLeaderBoardUserDtoToJson(this);

  ReferenceLeaderBoardUserEntity toEntity() => ReferenceLeaderBoardUserEntity(
        profilePicture: profilePicture != null
            ? profilePicture!.toEntity()
            : MediaDto().toEntity(),
        name: name ?? "",
        reference: reference ?? 0,
        rank: rank ?? 0,
      );
}
