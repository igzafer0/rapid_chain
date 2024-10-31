import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:rapid_chain/config/base/view_model/base_view_model.dart';
import 'package:rapid_chain/domain/entity/flow/flow_entity.dart';
import 'package:rapid_chain/domain/usecase/flow/flow_usecase.dart';
import 'package:rapid_chain/injector.dart';
part 'flow_view_model.g.dart';

class FlowViewModel = _FlowViewModelBase with _$FlowViewModel;

abstract class _FlowViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => viewModelContext = context;
  @override
  void init() {
    useCase = locator<FlowUsecase>();
    _getFlowData();
  }

  late FlowUsecase useCase;
  @observable
  List<FlowEntity>? flow;
  @action
  Future<void> _getFlowData() async {
    var result = await useCase.getFlow();
    if (result.isRight) {
      flow = result.right;
    }
  }
}
