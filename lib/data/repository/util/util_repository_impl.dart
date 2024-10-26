import 'package:either_dart/either.dart';
import 'package:rapid_chain/data/source/remote/util_remote_data_source.dart';
import 'package:rapid_chain/domain/entity/user_entity.dart';
import 'package:rapid_chain/domain/repository/util/util_repository.dart';
import 'package:rapid_chain/injector.dart';
import 'package:rapid_chain/util/resources/base_error_model.dart';

class UtilRepositoryImpl implements UtilRepository {
  @override
  Future<Either<BaseErrorModel, UserEntity>> me() async {
    var result = await locator<UtilRemoteDataSource>().me();
    if (result.isRight) {
      return Right(result.right.toEntity());
    }
    return Left(result.left);
  }
}
