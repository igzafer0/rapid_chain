import 'package:either_dart/either.dart';
import 'package:rapid_chain/domain/entity/task/task_entity.dart';
import 'package:rapid_chain/util/resources/base_error_model.dart';

abstract class TaskRepository {
  Future<Either<BaseErrorModel, List<TaskEntity>>> taskList();
  Future<Either<BaseErrorModel, TaskEntity>> taskDetail(int taskId);
  Future<BaseErrorModel?> collectCode(String code);
}
