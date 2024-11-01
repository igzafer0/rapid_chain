import 'package:either_dart/either.dart';
import 'package:rapid_chain/domain/entity/flow/flow_entity.dart';
import 'package:rapid_chain/domain/repository/flow/flow_repository.dart';
import 'package:rapid_chain/injector.dart';
import 'package:rapid_chain/util/resources/base_error_model.dart';

class FlowUsecase {
  Future<Either<BaseErrorModel, List<FlowEntity>>> getFlow() async {
    return await locator<FlowRepository>().getFlow();
  }

  Future<Either<BaseErrorModel, FlowEntity>> getCommentList(int flowId) async {
    return await locator<FlowRepository>().getCommentList(flowId);
  }

  Future<BaseErrorModel?> sendComment(
      int flowId, Map<String, dynamic> data) async {
    return await locator<FlowRepository>().sendComment(flowId, data);
  }

  Future<BaseErrorModel?> sendLike(int flowId) async {
    return await locator<FlowRepository>().sendLike(flowId);
  }
}
