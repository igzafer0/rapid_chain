import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:rapid_chain/config/base/view_model/base_view_model.dart';
import 'package:rapid_chain/domain/entity/flow/flow_entity.dart';
import 'package:rapid_chain/domain/usecase/flow/flow_usecase.dart';
import 'package:rapid_chain/injector.dart';
part 'comment_list_view_model.g.dart';

class CommentListViewModel = _CommentListViewModelBase
    with _$CommentListViewModel;

abstract class _CommentListViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @override
  void init() {
    usecase = locator<FlowUsecase>();
    _getComments();
  }

  late FlowUsecase usecase;
  int flowId = 0;
  @observable
  FlowEntity? flowEntity;

  @action
  Future<void> _getComments() async {
    var result = await usecase.getCommentList(flowId);
    if (result.isRight) {
      flowEntity = result.right;
    }
  }

  @observable
  int? parentCommentId;
  @action
  void clearParentCommentId() => parentCommentId = null;
  @action
  void changeParentCommentId(int id) => parentCommentId = id;

  String comment = "";
  Future<void> sendComment() async {
    await usecase.sendComment(flowId, {
      "content": comment,
      "parentCommentId": parentCommentId,
    });
    clearParentCommentId();
    _getComments();
  }
}
