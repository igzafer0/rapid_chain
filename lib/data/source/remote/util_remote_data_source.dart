import 'package:dio/dio.dart';
import 'package:rapid_chain/config/data/remote_manager.dart';
import 'package:rapid_chain/injector.dart';
import 'package:rapid_chain/util/enum/source_path.dart';
import 'package:rapid_chain/util/resources/base_error_model.dart';

abstract class UtilRemoteDataSource {
  Future<BaseErrorModel?> me();
}

class UtilRemoteDataSourceImpl extends UtilRemoteDataSource {
  @override
  Future<BaseErrorModel?> me() async {
    try {
      await locator<RemoteManager>()
          .networkManager
          .get(SourcePath.ME.rawValue());
      return null;
    } on DioException catch (e) {
      return BaseErrorModel.fromJson(e.response?.data ?? {});
    }
  }
}
