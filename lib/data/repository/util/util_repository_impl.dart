import 'package:rapid_chain/data/source/remote/util_remote_data_source.dart';
import 'package:rapid_chain/domain/repository/util/util_repository.dart';
import 'package:rapid_chain/injector.dart';
import 'package:rapid_chain/util/resources/base_error_model.dart';

class UtilRepositoryImpl implements UtilRepository {
  @override
  Future<BaseErrorModel?> me() async {
    return await locator<UtilRemoteDataSource>().me();
  }
}
