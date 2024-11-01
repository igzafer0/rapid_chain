import 'package:either_dart/either.dart';
import 'package:rapid_chain/domain/entity/flow/flow_entity.dart';
import 'package:rapid_chain/util/resources/base_error_model.dart';

abstract class FlowRepository {
  Future<Either<BaseErrorModel, List<FlowEntity>>> getFlow();
  Future<Either<BaseErrorModel, FlowEntity>> getCommentList(int flowId);
  Future<BaseErrorModel?> sendComment(int flowId, Map<String, dynamic> data);
  Future<BaseErrorModel?> sendLike(int flowId);
}
