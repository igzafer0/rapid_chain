import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobx/mobx.dart';
import 'package:rapid_chain/config/base/view_model/base_view_model.dart';
import 'package:rapid_chain/domain/usecase/util/util_usecase.dart';
import 'package:rapid_chain/injector.dart';
import 'package:rapid_chain/util/constant/navigation_constant.dart';
part 'splash_view_model.g.dart';

class SplashViewModel = _SplashViewModelBase with _$SplashViewModel;

abstract class _SplashViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => viewModelContext = context;
  late UtilUseCase useCase;

  @override
  void init() {
    useCase = locator<UtilUseCase>();
    _checkLogin();
  }

  Future<void> _checkLogin() async {
    var result = await useCase.me();
    if (result == null) {
      viewModelContext.pushReplacementNamed(NavigationConstant.HOME);
    } else {
      debugPrint("test ${result.title}");
    }
  }
}
