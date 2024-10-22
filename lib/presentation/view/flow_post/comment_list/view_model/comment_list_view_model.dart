import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:rapid_chain/config/base/view_model/base_view_model.dart';
part 'comment_list_view_model.g.dart';

class CommentListViewModel = _CommentListViewModelBase
    with _$CommentListViewModel;

abstract class _CommentListViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => viewModelContext = context;
  @override
  void init() {}
}
