import 'package:rapid_chain/domain/entity/media/media_entity.dart';

class PointLeaderBoardEntity {
  int userRank;
  int userPoint;
  int totalParticipants;
  List<PointLeaderBoardUserEntity> points;

  PointLeaderBoardEntity({
    required this.userPoint,
    required this.userRank,
    required this.totalParticipants,
    required this.points,
  });
}

class PointLeaderBoardUserEntity {
  MediaEntity profilePicture;
  String name;
  int point;
  int rank;

  PointLeaderBoardUserEntity(
      {required this.profilePicture,
      required this.name,
      required this.point,
      required this.rank});
}
