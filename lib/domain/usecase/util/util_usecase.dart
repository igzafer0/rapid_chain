import 'package:rapid_chain/domain/repository/util/util_repository.dart';
import 'package:rapid_chain/injector.dart';
import 'package:rapid_chain/util/resources/base_error_model.dart';

class UtilUseCase {
  Future<BaseErrorModel?> me() async {
    return await locator<UtilRepository>().me();
  }
}
