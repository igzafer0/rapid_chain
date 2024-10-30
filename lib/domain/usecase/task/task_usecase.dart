import 'package:either_dart/either.dart';
import 'package:rapid_chain/domain/entity/task/task_entity.dart';
import 'package:rapid_chain/domain/repository/task/task_repository.dart';
import 'package:rapid_chain/injector.dart';
import 'package:rapid_chain/util/resources/base_error_model.dart';

class TaskUseCase {
  Future<Either<BaseErrorModel, List<TaskEntity>>> taskList() async {
    return await locator<TaskRepository>().taskList();
  }

  Future<Either<BaseErrorModel, TaskEntity>> taskDetail(int taskId) async {
    return await locator<TaskRepository>().taskDetail(taskId);
  }

  Future<BaseErrorModel?> collectCode(String code) async {
    return await locator<TaskRepository>().collectCode(code);
  }
}
