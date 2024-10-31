import 'package:rapid_chain/domain/entity/media/media_entity.dart';

class ReferenceLeaderBoardEntity {
  int userRank;
  int userReference;
  int totalParticipants;
  List<ReferenceLeaderBoardUserEntity> references;

  ReferenceLeaderBoardEntity({
    required this.userReference,
    required this.userRank,
    required this.totalParticipants,
    required this.references,
  });
}

class ReferenceLeaderBoardUserEntity {
  MediaEntity profilePicture;
  String name;
  int reference;
  int rank;

  ReferenceLeaderBoardUserEntity(
      {required this.profilePicture,
      required this.name,
      required this.reference,
      required this.rank});
}
