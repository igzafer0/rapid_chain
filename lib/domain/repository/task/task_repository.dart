import 'package:rapid_chain/util/resources/base_error_model.dart';

abstract class TaskRepository {
  Future<BaseErrorModel?> taskList(Map<String, String> dto);
}
