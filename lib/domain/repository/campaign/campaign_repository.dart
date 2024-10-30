import 'package:either_dart/either.dart';
import 'package:rapid_chain/domain/entity/campaign/campaign_entity.dart';
import 'package:rapid_chain/util/resources/base_error_model.dart';

abstract class CampaignRepository {
  Future<Either<BaseErrorModel, CampaignEntity>> activeCampaign();
}
