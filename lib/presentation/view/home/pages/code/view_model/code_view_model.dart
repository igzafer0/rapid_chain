import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:rapid_chain/config/base/view_model/base_view_model.dart';
part 'code_view_model.g.dart';

class CodeViewModel = _CodeViewModelBase with _$CodeViewModel;

abstract class _CodeViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => viewModelContext = context;
  @override
  void init() {}
}
