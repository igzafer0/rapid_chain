import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:rapid_chain/config/data/remote_manager.dart';
import 'package:rapid_chain/data/dto/receive/leader_board/point_leader_board_dto.dart';
import 'package:rapid_chain/data/dto/receive/leader_board/reference_leader_board_dto.dart';
import 'package:rapid_chain/injector.dart';
import 'package:rapid_chain/util/enum/source_path.dart';
import 'package:rapid_chain/util/resources/base_error_model.dart';

abstract class LeaderBoardRemoteDataSource {
  Future<Either<BaseErrorModel, PointLeaderBoardDto>> pointLeaderBoard();
  Future<Either<BaseErrorModel, ReferenceLeaderBoardDto>>
      referenceLeaderBoard();
}

class LeaderBoardRemoteDataSourceImpl extends LeaderBoardRemoteDataSource {
  @override
  Future<Either<BaseErrorModel, PointLeaderBoardDto>> pointLeaderBoard() async {
    try {
      var result = await locator<RemoteManager>()
          .networkManager
          .get(SourcePath.POINT_LEADER_BOARD.rawValue());
      return Right(PointLeaderBoardDto.fromJson(result.data));
    } on DioException catch (e) {
      return Left(BaseErrorModel.fromJson(e.response?.data ?? {}));
    }
  }

  @override
  Future<Either<BaseErrorModel, ReferenceLeaderBoardDto>>
      referenceLeaderBoard() async {
    try {
      var result = await locator<RemoteManager>()
          .networkManager
          .get(SourcePath.REFERENCE_LEADER_BOARD.rawValue());
      return Right(ReferenceLeaderBoardDto.fromJson(result.data));
    } on DioException catch (e) {
      return Left(BaseErrorModel.fromJson(e.response?.data ?? {}));
    }
  }
}
