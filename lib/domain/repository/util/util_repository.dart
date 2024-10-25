import 'package:rapid_chain/util/resources/base_error_model.dart';

abstract class UtilRepository {
  Future<BaseErrorModel?> me();
}
