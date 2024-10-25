import 'package:rapid_chain/util/resources/base_error_model.dart';

abstract class AuthRepository {
  Future<BaseErrorModel?> sendOtp(Map<String, String> dto);
}
