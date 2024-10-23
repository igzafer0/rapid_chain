import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:rapid_chain/config/base/view_model/base_view_model.dart';
part 'referance_view_model.g.dart';

class ReferanceViewModel = _ReferanceViewModelBase with _$ReferanceViewModel;

abstract class _ReferanceViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => viewModelContext = context;
  @override
  void init() {}
}
