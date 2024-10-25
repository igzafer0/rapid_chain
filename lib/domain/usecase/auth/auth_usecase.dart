import 'package:rapid_chain/domain/repository/auth/auth_repository.dart';
import 'package:rapid_chain/injector.dart';
import 'package:rapid_chain/util/resources/base_error_model.dart';

class AuthUseCase {
  Future<BaseErrorModel?> sendOtp(Map<String, String> dto) async {
    return await locator<AuthRepository>().sendOtp(dto);
  }
}
