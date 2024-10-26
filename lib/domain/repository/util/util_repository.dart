import 'package:either_dart/either.dart';
import 'package:rapid_chain/domain/entity/user_entity.dart';
import 'package:rapid_chain/util/resources/base_error_model.dart';

abstract class UtilRepository {
  Future<Either<BaseErrorModel, UserEntity>> me();
}
