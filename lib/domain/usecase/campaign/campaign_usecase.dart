import 'package:either_dart/either.dart';
import 'package:rapid_chain/domain/entity/campaign/campaign_entity.dart';
import 'package:rapid_chain/domain/repository/campaign/campaign_repository.dart';
import 'package:rapid_chain/injector.dart';
import 'package:rapid_chain/util/resources/base_error_model.dart';

class CampaignUsecase {
  Future<Either<BaseErrorModel, CampaignEntity>> activeCampaign() async {
    return await locator<CampaignRepository>().activeCampaign();
  }
}
