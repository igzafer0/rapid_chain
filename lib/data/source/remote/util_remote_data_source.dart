import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:rapid_chain/config/data/remote_manager.dart';
import 'package:rapid_chain/data/dto/receive/app_info/app_info_dto.dart';
import 'package:rapid_chain/data/dto/receive/user/user_dto.dart';
import 'package:rapid_chain/injector.dart';
import 'package:rapid_chain/util/enum/source_path.dart';
import 'package:rapid_chain/util/resources/base_error_model.dart';

abstract class UtilRemoteDataSource {
  Future<Either<BaseErrorModel, UserDto>> me();
  Future<Either<BaseErrorModel, AppInfoDto>> appInfo();
}

class UtilRemoteDataSourceImpl extends UtilRemoteDataSource {
  @override
  Future<Either<BaseErrorModel, UserDto>> me() async {
    try {
      var result = await locator<RemoteManager>()
          .networkManager
          .get(SourcePath.ME.rawValue());
      return Right(UserDto.fromJson(result.data));
    } on DioException catch (e) {
      return Left(BaseErrorModel.fromJson(e.response?.data ?? {}));
    }
  }

  @override
  Future<Either<BaseErrorModel, AppInfoDto>> appInfo() async {
    try {
      var result = await locator<RemoteManager>()
          .networkManager
          .get(SourcePath.APP_INFO.rawValue());
      return Right(AppInfoDto.fromJson(result.data));
    } on DioException catch (e) {
      return Left(BaseErrorModel.fromJson(e.response?.data ?? {}));
    }
  }
}
