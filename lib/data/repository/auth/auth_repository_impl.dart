import 'package:rapid_chain/data/source/remote/auth_remote_data_source.dart';
import 'package:rapid_chain/domain/repository/auth/auth_repository.dart';
import 'package:rapid_chain/injector.dart';
import 'package:rapid_chain/util/resources/base_error_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<BaseErrorModel?> sendOtp(Map<String, String> dto) async {
    return await locator<AuthRemoteDataSource>().sendOtp(dto);
  }
}