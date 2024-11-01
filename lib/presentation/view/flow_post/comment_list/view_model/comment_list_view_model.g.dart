// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_list_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CommentListViewModel on _CommentListViewModelBase, Store {
  late final _$flowEntityAtom =
      Atom(name: '_CommentListViewModelBase.flowEntity', context: context);

  @override
  FlowEntity? get flowEntity {
    _$flowEntityAtom.reportRead();
    return super.flowEntity;
  }

  @override
  set flowEntity(FlowEntity? value) {
    _$flowEntityAtom.reportWrite(value, super.flowEntity, () {
      super.flowEntity = value;
    });
  }

  late final _$parentCommentIdAtom =
      Atom(name: '_CommentListViewModelBase.parentCommentId', context: context);

  @override
  int? get parentCommentId {
    _$parentCommentIdAtom.reportRead();
    return super.parentCommentId;
  }

  @override
  set parentCommentId(int? value) {
    _$parentCommentIdAtom.reportWrite(value, super.parentCommentId, () {
      super.parentCommentId = value;
    });
  }

  late final _$_getCommentsAsyncAction =
      AsyncAction('_CommentListViewModelBase._getComments', context: context);

  @override
  Future<void> _getComments() {
    return _$_getCommentsAsyncAction.run(() => super._getComments());
  }

  late final _$_CommentListViewModelBaseActionController =
      ActionController(name: '_CommentListViewModelBase', context: context);

  @override
  void clearParentCommentId() {
    final _$actionInfo = _$_CommentListViewModelBaseActionController
        .startAction(name: '_CommentListViewModelBase.clearParentCommentId');
    try {
      return super.clearParentCommentId();
    } finally {
      _$_CommentListViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeParentCommentId(int id) {
    final _$actionInfo = _$_CommentListViewModelBaseActionController
        .startAction(name: '_CommentListViewModelBase.changeParentCommentId');
    try {
      return super.changeParentCommentId(id);
    } finally {
      _$_CommentListViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
flowEntity: ${flowEntity},
parentCommentId: ${parentCommentId}
    ''';
  }
}
