import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:rapid_chain/config/data/remote_manager.dart';
import 'package:rapid_chain/data/dto/receive/task/task_dto.dart';
import 'package:rapid_chain/injector.dart';
import 'package:rapid_chain/util/enum/source_path.dart';
import 'package:rapid_chain/util/resources/base_error_model.dart';

abstract class TaskRemoteDataSource {
  Future<Either<BaseErrorModel, List<TaskDto>>> taskList();
  Future<Either<BaseErrorModel, TaskDto>> taskDetail(int taskId);
}

class TaskRemoteDataSourceImpl extends TaskRemoteDataSource {
  @override
  Future<Either<BaseErrorModel, List<TaskDto>>> taskList() async {
    try {
      var result = await locator<RemoteManager>()
          .networkManager
          .get(SourcePath.TASK_LIST.rawValue());
      return Right(
          (result.data as List).map((e) => TaskDto.fromJson(e)).toList());
    } on DioException catch (e) {
      return Left(BaseErrorModel.fromJson(e.response?.data ?? {}));
    }
  }

  @override
  Future<Either<BaseErrorModel, TaskDto>> taskDetail(int taskId) async {
    try {
      var result = await locator<RemoteManager>()
          .networkManager
          .get(SourcePath.TASK.rawValue(data: [taskId]));
      return Right(TaskDto.fromJson(result.data));
    } on DioException catch (e) {
      return Left(BaseErrorModel.fromJson(e.response?.data ?? {}));
    }
  }
}
