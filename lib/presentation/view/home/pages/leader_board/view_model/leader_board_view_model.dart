import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:rapid_chain/config/base/view_model/base_view_model.dart';
part 'leader_board_view_model.g.dart';

class LeaderBoardViewModel = _LeaderBoardViewModelBase
    with _$LeaderBoardViewModel;

abstract class _LeaderBoardViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => viewModelContext = context;
  @override
  void init() {}
  @observable
  int PageIndex = 0;

  @action
  void ChangePageIndex(int NewPageIndex) => PageIndex = NewPageIndex;
}
