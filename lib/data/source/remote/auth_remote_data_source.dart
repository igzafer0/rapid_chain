import 'package:dio/dio.dart';
import 'package:rapid_chain/config/data/remote_manager.dart';
import 'package:rapid_chain/data/dto/send/auth/login/login_dto.dart';
import 'package:rapid_chain/data/dto/send/auth/register/register_dto.dart';
import 'package:rapid_chain/injector.dart';
import 'package:rapid_chain/util/enum/source_path.dart';
import 'package:rapid_chain/util/resources/base_error_model.dart';

abstract class AuthRemoteDataSource {
  Future<BaseErrorModel?> sendOtp(Map<String, String> dto);
  Future<BaseErrorModel?> register(RegisterDto dto);
  Future<BaseErrorModel?> login(LoginDto dto);
  Future<BaseErrorModel?> validateOtp(Map<String, String> dto);
  Future<BaseErrorModel?> validateWallet(Map<String, String> dto);
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  @override
  Future<BaseErrorModel?> sendOtp(Map<String, String> dto) async {
    try {
      await locator<RemoteManager>()
          .networkManager
          .post(SourcePath.SEND_OTP.rawValue(), data: dto);
      return null;
    } on DioException catch (e) {
      return BaseErrorModel.fromJson(e.response?.data ?? {});
    }
  }

  @override
  Future<BaseErrorModel?> register(RegisterDto dto) async {
    try {
      await locator<RemoteManager>()
          .networkManager
          .post(SourcePath.REGISTER.rawValue(), data: dto.toJson());
      return null;
    } on DioException catch (e) {
      return BaseErrorModel.fromJson(e.response?.data ?? {});
    }
  }

  @override
  Future<BaseErrorModel?> login(LoginDto dto) async {
    try {
      await locator<RemoteManager>()
          .networkManager
          .post(SourcePath.LOGIN.rawValue(), data: dto.toJson());
      return null;
    } on DioException catch (e) {
      return BaseErrorModel.fromJson(e.response?.data ?? {});
    }
  }

  @override
  Future<BaseErrorModel?> validateOtp(Map<String, String> dto) async {
    try {
      await locator<RemoteManager>()
          .networkManager
          .post(SourcePath.VALIDATE_OTP.rawValue(), data: dto);
      return null;
    } on DioException catch (e) {
      return BaseErrorModel.fromJson(e.response?.data ?? {});
    }
  }

  @override
  Future<BaseErrorModel?> validateWallet(Map<String, String> dto) async {
    try {
      await locator<RemoteManager>()
          .networkManager
          .post(SourcePath.VALIDATE_WALLET.rawValue(), data: dto);
      return null;
    } on DioException catch (e) {
      return BaseErrorModel.fromJson(e.response?.data ?? {});
    }
  }
}
