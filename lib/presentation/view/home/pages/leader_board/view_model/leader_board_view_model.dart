import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:rapid_chain/config/base/view_model/base_view_model.dart';
import 'package:rapid_chain/domain/entity/leader_board/point_leader_board_entity.dart';
import 'package:rapid_chain/domain/entity/leader_board/reference_leader_board_entity.dart';
import 'package:rapid_chain/domain/usecase/leader_board/leader_board_usecase.dart';
import 'package:rapid_chain/injector.dart';
part 'leader_board_view_model.g.dart';

class LeaderBoardViewModel = _LeaderBoardViewModelBase
    with _$LeaderBoardViewModel;

abstract class _LeaderBoardViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => viewModelContext = context;
  @override
  void init() {
    usecase = locator<LeaderBoardUsecase>();
    _getPointLeaderBoard();
    _getReferenceLeaderBoard();
  }

  @observable
  int PageIndex = 0;

  late LeaderBoardUsecase usecase;
  @observable
  PointLeaderBoardEntity? pointLeaderBoardEntity;

  @observable
  ReferenceLeaderBoardEntity? referenceLeaderBoardEntity;
  @action
  Future<void> _getPointLeaderBoard() async {
    var result = await usecase.pointLeaderBoard();
    if (result.isRight) {
      pointLeaderBoardEntity = result.right;
    }
  }

  @action
  Future<void> _getReferenceLeaderBoard() async {
    var result = await usecase.referenceLeaderBoard();
    if (result.isRight) {
      referenceLeaderBoardEntity = result.right;
    }
  }

  @action
  void ChangePageIndex(int NewPageIndex) => PageIndex = NewPageIndex;
}
