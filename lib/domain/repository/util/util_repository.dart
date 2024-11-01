import 'package:either_dart/either.dart';
import 'package:rapid_chain/domain/entity/app_info/app_info_entity.dart';
import 'package:rapid_chain/domain/entity/reference/my_reference_user_entity.dart';
import 'package:rapid_chain/domain/entity/user/user_entity.dart';
import 'package:rapid_chain/util/resources/base_error_model.dart';

abstract class UtilRepository {
  Future<Either<BaseErrorModel, UserEntity>> me();
  Future<Either<BaseErrorModel, AppInfoEntity>> appInfo();
  Future<Either<BaseErrorModel, List<MyReferenceUserEntity>>> myReferenceList();
}
