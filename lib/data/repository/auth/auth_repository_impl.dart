import 'package:rapid_chain/data/dto/send/auth/login/login_dto.dart';
import 'package:rapid_chain/data/dto/send/auth/register/register_dto.dart';
import 'package:rapid_chain/data/source/remote/auth_remote_data_source.dart';
import 'package:rapid_chain/domain/repository/auth/auth_repository.dart';
import 'package:rapid_chain/injector.dart';
import 'package:rapid_chain/util/resources/base_error_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<BaseErrorModel?> sendOtp(Map<String, String> dto) async {
    return await locator<AuthRemoteDataSource>().sendOtp(dto);
  }

  @override
  Future<BaseErrorModel?> register(RegisterDto dto) async {
    return await locator<AuthRemoteDataSource>().register(dto);
  }

  @override
  Future<BaseErrorModel?> login(LoginDto dto) async {
    return await locator<AuthRemoteDataSource>().login(dto);
  }

  @override
  Future<BaseErrorModel?> validateOtp(Map<String, String> dto) async {
    return await locator<AuthRemoteDataSource>().validateOtp(dto);
  }

  @override
  Future<BaseErrorModel?> validateWallet(Map<String, String> dto) async {
    return await locator<AuthRemoteDataSource>().validateWallet(dto);
  }
}
