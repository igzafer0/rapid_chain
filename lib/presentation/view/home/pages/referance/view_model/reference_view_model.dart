import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:rapid_chain/config/base/view_model/base_view_model.dart';
part 'reference_view_model.g.dart';

class ReferenceViewModel = _ReferenceViewModelBase with _$ReferenceViewModel;

abstract class _ReferenceViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => viewModelContext = context;
  @override
  void init() {}
}
