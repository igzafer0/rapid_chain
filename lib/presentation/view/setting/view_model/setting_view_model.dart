import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:rapid_chain/config/base/view_model/base_view_model.dart';
part 'setting_view_model.g.dart';

class SettingViewModel = _SettingViewModelBase with _$SettingViewModel;

abstract class _SettingViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => viewModelContext = context;
  @override
  void init() {}
}
