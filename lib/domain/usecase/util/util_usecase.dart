import 'package:either_dart/either.dart';
import 'package:rapid_chain/domain/entity/app_info/app_info_entity.dart';
import 'package:rapid_chain/domain/entity/user/user_entity.dart';
import 'package:rapid_chain/domain/repository/util/util_repository.dart';
import 'package:rapid_chain/injector.dart';
import 'package:rapid_chain/util/resources/base_error_model.dart';

class UtilUseCase {
  Future<Either<BaseErrorModel, UserEntity>> me() async {
    return await locator<UtilRepository>().me();
  }

  Future<Either<BaseErrorModel, AppInfoEntity>> appInfo() async {
    return await locator<UtilRepository>().appInfo();
  }
}
