import 'package:rapid_chain/domain/entity/media/media_entity.dart';

final class CommentEntity {
  int id;
  String content;
  int parentId;
  DateTime createdDate;
  CommentUserEntity user;
  CommentEntity({
    required this.id,
    required this.content,
    required this.parentId,
    required this.createdDate,
    required this.user,
  });
}

final class CommentUserEntity {
  String userName;
  MediaEntity profilePicture;
  CommentUserEntity({
    required this.userName,
    required this.profilePicture,
  });
}
