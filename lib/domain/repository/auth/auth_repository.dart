import 'package:rapid_chain/data/dto/send/auth/login/login_dto.dart';
import 'package:rapid_chain/data/dto/send/auth/register/register_dto.dart';
import 'package:rapid_chain/util/resources/base_error_model.dart';

abstract class AuthRepository {
  Future<BaseErrorModel?> sendOtp(Map<String, String> dto);
  Future<BaseErrorModel?> register(RegisterDto dto);
  Future<BaseErrorModel?> login(LoginDto dto);
}
