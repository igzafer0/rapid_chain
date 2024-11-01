import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:rapid_chain/config/data/remote_manager.dart';
import 'package:rapid_chain/data/dto/receive/flow/flow_dto.dart';
import 'package:rapid_chain/injector.dart';
import 'package:rapid_chain/util/enum/source_path.dart';
import 'package:rapid_chain/util/resources/base_error_model.dart';

abstract class FlowRemoteDataSource {
  Future<Either<BaseErrorModel, List<FlowDto>>> getFlow();
  Future<Either<BaseErrorModel, FlowDto>> getCommentList(int flowId);
  Future<BaseErrorModel?> sendComment(int flowId, Map<String, dynamic> data);
}

class FlowRemoteDataSourceImpl extends FlowRemoteDataSource {
  @override
  Future<Either<BaseErrorModel, List<FlowDto>>> getFlow() async {
    try {
      var result = await locator<RemoteManager>()
          .networkManager
          .get(SourcePath.FLOW.rawValue());
      return Right(
          (result.data as List).map((e) => FlowDto.fromJson(e)).toList());
    } on DioException catch (e) {
      return Left(BaseErrorModel.fromJson(e.response?.data ?? {}));
    }
  }

  @override
  Future<Either<BaseErrorModel, FlowDto>> getCommentList(int flowId) async {
    try {
      var result = await locator<RemoteManager>()
          .networkManager
          .get(SourcePath.FLOW_COMMENT.rawValue(data: [flowId]));
      return Right(FlowDto.fromJson(result.data));
    } on DioException catch (e) {
      return Left(BaseErrorModel.fromJson(e.response?.data ?? {}));
    }
  }

  @override
  Future<BaseErrorModel?> sendComment(
      int flowId, Map<String, dynamic> data) async {
    try {
      await locator<RemoteManager>()
          .networkManager
          .post(SourcePath.SEND_COMMENT.rawValue(data: [flowId]), data: data);
      return null;
    } on DioException catch (e) {
      return BaseErrorModel.fromJson(e.response?.data ?? {});
    }
  }
}
