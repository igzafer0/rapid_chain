import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:rapid_chain/config/base/view_model/base_view_model.dart';
import 'package:rapid_chain/domain/usecase/util/util_usecase.dart';
import 'package:rapid_chain/injector.dart';
part 'app_info_view_model.g.dart';

class AppInfoViewModel = _AppInfoViewModelBase with _$AppInfoViewModel;

abstract class _AppInfoViewModelBase with Store, BaseViewModel {
  late UtilUseCase useCase;
  @override
  void setContext(BuildContext context) => viewModelContext = context;
  @override
  void init() {
    useCase = locator<UtilUseCase>();
    _getAppInfo();
  }

  @observable
  String appInfoHtml = "";
  @action
  Future<void> _getAppInfo() async {
    var result = await useCase.appInfo();
    if (result.isRight) {
      appInfoHtml = result.right.content;
    }
  }
}
