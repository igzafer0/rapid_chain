import 'package:either_dart/either.dart';
import 'package:rapid_chain/data/source/remote/flow_remote_data_source.dart';
import 'package:rapid_chain/domain/entity/flow/flow_entity.dart';
import 'package:rapid_chain/domain/repository/flow/flow_repository.dart';
import 'package:rapid_chain/injector.dart';
import 'package:rapid_chain/util/resources/base_error_model.dart';

class FlowRepositoryImpl implements FlowRepository {
  @override
  Future<Either<BaseErrorModel, List<FlowEntity>>> getFlow() async {
    var result = await locator<FlowRemoteDataSource>().getFlow();
    if (result.isRight) {
      return Right(result.right.map((e) => e.toEntity()).toList());
    }
    return Left(result.left);
  }

  @override
  Future<Either<BaseErrorModel, FlowEntity>> getCommentList(int flowId) async {
    var result = await locator<FlowRemoteDataSource>().getCommentList(flowId);
    if (result.isRight) {
      return Right(result.right.toEntity());
    }
    return Left(result.left);
  }

  @override
  Future<BaseErrorModel?> sendComment(
      int flowId, Map<String, dynamic> data) async {
    return await locator<FlowRemoteDataSource>().sendComment(flowId, data);
  }

  @override
  Future<BaseErrorModel?> sendLike(int flowId) async {
    return await locator<FlowRemoteDataSource>().sendLike(flowId);
  }
}
