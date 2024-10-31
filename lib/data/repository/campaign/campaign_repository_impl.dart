import 'package:either_dart/either.dart';
import 'package:rapid_chain/data/source/remote/campaign_remote_data_source.dart';
import 'package:rapid_chain/domain/entity/campaign/campaign_entity.dart';
import 'package:rapid_chain/domain/repository/campaign/campaign_repository.dart';
import 'package:rapid_chain/injector.dart';
import 'package:rapid_chain/util/resources/base_error_model.dart';

class CampaignRepositoryImpl implements CampaignRepository {
  @override
  Future<Either<BaseErrorModel, CampaignEntity>> activeCampaign() async {
    var result = await locator<CampaignRemoteDataSource>().activeCampaign();
    if (result.isRight) {
      return Right(result.right.toEntity());
    }
    return Left(result.left);
  }

  @override
  Future<BaseErrorModel?> collectDailyPoint() async {
    return await locator<CampaignRemoteDataSource>().collectDailyPoint();
  }
}
