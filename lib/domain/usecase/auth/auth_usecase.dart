import 'package:rapid_chain/data/dto/send/auth/login/login_dto.dart';
import 'package:rapid_chain/data/dto/send/auth/register/register_dto.dart';
import 'package:rapid_chain/domain/repository/auth/auth_repository.dart';
import 'package:rapid_chain/injector.dart';
import 'package:rapid_chain/util/resources/base_error_model.dart';

class AuthUseCase {
  Future<BaseErrorModel?> sendOtp(Map<String, String> dto) async {
    return await locator<AuthRepository>().sendOtp(dto);
  }

  Future<BaseErrorModel?> register(RegisterDto dto) async {
    return await locator<AuthRepository>().register(dto);
  }

  Future<BaseErrorModel?> login(LoginDto dto) async {
    return await locator<AuthRepository>().login(dto);
  }

  Future<BaseErrorModel?> validateOtp(Map<String, String> dto) async {
    return await locator<AuthRepository>().validateOtp(dto);
  }

  Future<BaseErrorModel?> validateWallet(Map<String, String> dto) async {
    return await locator<AuthRepository>().validateWallet(dto);
  }
}
