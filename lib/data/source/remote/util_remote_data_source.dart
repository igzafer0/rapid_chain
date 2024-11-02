import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:rapid_chain/config/data/remote_manager.dart';
import 'package:rapid_chain/data/dto/receive/app_info/app_info_dto.dart';
import 'package:rapid_chain/data/dto/receive/reference/my_reference_user_dto.dart';
import 'package:rapid_chain/data/dto/receive/user/user_dto.dart';
import 'package:rapid_chain/injector.dart';
import 'package:rapid_chain/util/enum/source_path.dart';
import 'package:rapid_chain/util/resources/base_error_model.dart';

abstract class UtilRemoteDataSource {
  Future<Either<BaseErrorModel, UserDto>> me();
  Future<Either<BaseErrorModel, AppInfoDto>> appInfo();
  Future<Either<BaseErrorModel, List<MyReferenceUserDto>>> myReferenceList();
  Future<BaseErrorModel?> changePassword(Map<String, String> data);
  Future<BaseErrorModel?> changeWallet(Map<String, String> data);
  Future<BaseErrorModel?> forgotPassword(Map<String, String> data);
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

  @override
  Future<Either<BaseErrorModel, List<MyReferenceUserDto>>>
      myReferenceList() async {
    try {
      var result = await locator<RemoteManager>()
          .networkManager
          .get(SourcePath.MY_REFERENCE.rawValue());
      return Right((result.data as List)
          .map((e) => MyReferenceUserDto.fromJson(e))
          .toList());
    } on DioException catch (e) {
      return Left(BaseErrorModel.fromJson(e.response?.data ?? {}));
    }
  }

  @override
  Future<BaseErrorModel?> changePassword(Map<String, String> data) async {
    try {
      await locator<RemoteManager>()
          .networkManager
          .post(SourcePath.CHANGE_PASSWORD.rawValue(), data: data);
      return null;
    } on DioException catch (e) {
      return BaseErrorModel.fromJson(e.response?.data ?? {});
    }
  }

  @override
  Future<BaseErrorModel?> changeWallet(Map<String, String> data) async {
    try {
      await locator<RemoteManager>()
          .networkManager
          .post(SourcePath.CHANGE_WALLET.rawValue(), data: data);
      return null;
    } on DioException catch (e) {
      return BaseErrorModel.fromJson(e.response?.data ?? {});
    }
  }

  @override
  Future<BaseErrorModel?> forgotPassword(Map<String, String> data) async {
    try {
      await locator<RemoteManager>()
          .networkManager
          .post(SourcePath.FORGOT_PASSWORD.rawValue(), data: data);
      return null;
    } on DioException catch (e) {
      return BaseErrorModel.fromJson(e.response?.data ?? {});
    }
  }
}
