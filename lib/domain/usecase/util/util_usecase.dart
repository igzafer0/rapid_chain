import 'package:either_dart/either.dart';
import 'package:rapid_chain/domain/entity/app_info/app_info_entity.dart';
import 'package:rapid_chain/domain/entity/reference/my_reference_user_entity.dart';
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

  Future<Either<BaseErrorModel, List<MyReferenceUserEntity>>>
      myReferenceList() async {
    return await locator<UtilRepository>().myReferenceList();
  }

  Future<BaseErrorModel?> changePassword(Map<String, String> data) async {
    return await locator<UtilRepository>().changePassword(data);
  }

  Future<BaseErrorModel?> changeWallet(Map<String, String> data) async {
    return await locator<UtilRepository>().changeWallet(data);
  }

  Future<BaseErrorModel?> forgotPassword(Map<String, String> data) async {
    return await locator<UtilRepository>().forgotPassword(data);
  }
}
