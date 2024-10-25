import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobx/mobx.dart';
import 'package:rapid_chain/config/base/view_model/base_view_model.dart';
import 'package:rapid_chain/config/data/remote_manager.dart';
import 'package:rapid_chain/config/data/shared_manager.dart';
import 'package:rapid_chain/injector.dart';
import 'package:rapid_chain/util/constant/navigation_constant.dart';
import 'package:rapid_chain/util/resources/authentication_source.dart';
part 'setting_view_model.g.dart';

class SettingViewModel = _SettingViewModelBase with _$SettingViewModel;

abstract class _SettingViewModelBase with Store, BaseViewModel {
  get navigation => null;

  @override
  void setContext(BuildContext context) => viewModelContext = context;
  @override
  void init() {}

  void logOut() {
    locator<SharedManager>().clearAll();
    locator<AuthenticationSource>().clearAccessToken();
    locator<RemoteManager>().networkManager.options.headers.clear();
    viewModelContext.go(NavigationConstant.MAIN);
  }
}
