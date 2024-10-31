import 'package:rapid_chain/domain/entity/media/media_entity.dart';

class FlowEntity {
  int id;
  String content;
  MediaEntity mediaItem;
  bool isLiked;

  FlowEntity({
    required this.id,
    required this.content,
    required this.mediaItem,
    required this.isLiked,
  });
}
