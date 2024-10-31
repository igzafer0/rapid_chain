import 'package:either_dart/either.dart';
import 'package:rapid_chain/domain/entity/leader_board/point_leader_board_entity.dart';
import 'package:rapid_chain/domain/entity/leader_board/reference_leader_board_entity.dart';
import 'package:rapid_chain/util/resources/base_error_model.dart';

abstract class LeaderBoardRepository {
  Future<Either<BaseErrorModel, PointLeaderBoardEntity>> pointLeaderBoard();
  Future<Either<BaseErrorModel, ReferenceLeaderBoardEntity>>
      referenceLeaderBoard();
}
