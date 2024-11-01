import 'package:rapid_chain/domain/entity/flow/comment_entity.dart';
import 'package:rapid_chain/domain/entity/media/media_entity.dart';

class FlowEntity {
  int id;
  String content;
  MediaEntity mediaItem;
  bool isLiked;
  List<CommentEntity> comments;
  int likeCount;
  CommentUserEntity user;
  DateTime createdDate;

  FlowEntity({
    required this.id,
    required this.user,
    required this.content,
    required this.mediaItem,
    required this.isLiked,
    required this.likeCount,
    required this.comments,
    required this.createdDate,
  });
}
