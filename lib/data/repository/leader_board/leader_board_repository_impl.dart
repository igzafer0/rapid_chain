import 'package:either_dart/either.dart';
import 'package:rapid_chain/data/source/remote/leader_board_remote_data_source.dart';
import 'package:rapid_chain/domain/entity/leader_board/point_leader_board_entity.dart';
import 'package:rapid_chain/domain/entity/leader_board/reference_leader_board_entity.dart';
import 'package:rapid_chain/domain/repository/leader_board/leader_board_repository.dart';
import 'package:rapid_chain/injector.dart';
import 'package:rapid_chain/util/resources/base_error_model.dart';

class LeaderBoardRepositoryImpl implements LeaderBoardRepository {
  @override
  Future<Either<BaseErrorModel, PointLeaderBoardEntity>>
      pointLeaderBoard() async {
    var result =
        await locator<LeaderBoardRemoteDataSource>().pointLeaderBoard();
    if (result.isRight) {
      return Right(result.right.toEntity());
    }
    return Left(result.left);
  }

  @override
  Future<Either<BaseErrorModel, ReferenceLeaderBoardEntity>>
      referenceLeaderBoard() async {
    var result =
        await locator<LeaderBoardRemoteDataSource>().referenceLeaderBoard();
    if (result.isRight) {
      return Right(result.right.toEntity());
    }
    return Left(result.left);
  }
}
