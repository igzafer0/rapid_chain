import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:rapid_chain/config/data/remote_manager.dart';
import 'package:rapid_chain/data/dto/receive/campaign/campaign_dto.dart';
import 'package:rapid_chain/injector.dart';
import 'package:rapid_chain/util/enum/source_path.dart';
import 'package:rapid_chain/util/resources/base_error_model.dart';

abstract class CampaignRemoteDataSource {
  Future<Either<BaseErrorModel, CampaignDto>> activeCampaign();
  Future<BaseErrorModel?> collectDailyPoint();
}

class CampaignRemoteDataSourceImpl extends CampaignRemoteDataSource {
  @override
  Future<Either<BaseErrorModel, CampaignDto>> activeCampaign() async {
    try {
      var result = await locator<RemoteManager>()
          .networkManager
          .get(SourcePath.ACTIVE_CAMPAIGN.rawValue());
      return Right(CampaignDto.fromJson(result.data));
    } on DioException catch (e) {
      return Left(BaseErrorModel.fromJson(e.response?.data ?? {}));
    }
  }

  @override
  Future<BaseErrorModel?> collectDailyPoint() async {
    try {
      await locator<RemoteManager>()
          .networkManager
          .post(SourcePath.COLLECT_DAILY_POINT.rawValue());
      return null;
    } on DioException catch (e) {
      return BaseErrorModel.fromJson(e.response?.data ?? {});
    }
  }
}
