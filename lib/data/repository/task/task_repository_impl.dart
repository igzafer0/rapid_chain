import 'package:either_dart/either.dart';
import 'package:rapid_chain/data/source/remote/task_remote_data_source.dart';
import 'package:rapid_chain/domain/entity/task/task_entity.dart';
import 'package:rapid_chain/domain/repository/task/task_repository.dart';
import 'package:rapid_chain/injector.dart';
import 'package:rapid_chain/util/resources/base_error_model.dart';

class TaskRepositoryImpl implements TaskRepository {
  @override
  Future<Either<BaseErrorModel, List<TaskEntity>>> taskList() async {
    var result = await locator<TaskRemoteDataSource>().taskList();
    if (result.isRight) {
      return Right(result.right.map((e) => e.toEntity()).toList());
    }
    return Left(result.left);
  }

  @override
  Future<Either<BaseErrorModel, TaskEntity>> taskDetail(int taskId) async {
    var result = await locator<TaskRemoteDataSource>().taskDetail(taskId);
    if (result.isRight) {
      return Right(result.right.toEntity());
    }
    return Left(result.left);
  }
}
