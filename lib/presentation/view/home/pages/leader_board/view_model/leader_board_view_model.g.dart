// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leader_board_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LeaderBoardViewModel on _LeaderBoardViewModelBase, Store {
  late final _$PageIndexAtom =
      Atom(name: '_LeaderBoardViewModelBase.PageIndex', context: context);

  @override
  int get PageIndex {
    _$PageIndexAtom.reportRead();
    return super.PageIndex;
  }

  @override
  set PageIndex(int value) {
    _$PageIndexAtom.reportWrite(value, super.PageIndex, () {
      super.PageIndex = value;
    });
  }

  late final _$pointLeaderBoardEntityAtom = Atom(
      name: '_LeaderBoardViewModelBase.pointLeaderBoardEntity',
      context: context);

  @override
  PointLeaderBoardEntity? get pointLeaderBoardEntity {
    _$pointLeaderBoardEntityAtom.reportRead();
    return super.pointLeaderBoardEntity;
  }

  @override
  set pointLeaderBoardEntity(PointLeaderBoardEntity? value) {
    _$pointLeaderBoardEntityAtom
        .reportWrite(value, super.pointLeaderBoardEntity, () {
      super.pointLeaderBoardEntity = value;
    });
  }

  late final _$referenceLeaderBoardEntityAtom = Atom(
      name: '_LeaderBoardViewModelBase.referenceLeaderBoardEntity',
      context: context);

  @override
  ReferenceLeaderBoardEntity? get referenceLeaderBoardEntity {
    _$referenceLeaderBoardEntityAtom.reportRead();
    return super.referenceLeaderBoardEntity;
  }

  @override
  set referenceLeaderBoardEntity(ReferenceLeaderBoardEntity? value) {
    _$referenceLeaderBoardEntityAtom
        .reportWrite(value, super.referenceLeaderBoardEntity, () {
      super.referenceLeaderBoardEntity = value;
    });
  }

  late final _$_getPointLeaderBoardAsyncAction = AsyncAction(
      '_LeaderBoardViewModelBase._getPointLeaderBoard',
      context: context);

  @override
  Future<void> _getPointLeaderBoard() {
    return _$_getPointLeaderBoardAsyncAction
        .run(() => super._getPointLeaderBoard());
  }

  late final _$_getReferenceLeaderBoardAsyncAction = AsyncAction(
      '_LeaderBoardViewModelBase._getReferenceLeaderBoard',
      context: context);

  @override
  Future<void> _getReferenceLeaderBoard() {
    return _$_getReferenceLeaderBoardAsyncAction
        .run(() => super._getReferenceLeaderBoard());
  }

  late final _$_LeaderBoardViewModelBaseActionController =
      ActionController(name: '_LeaderBoardViewModelBase', context: context);

  @override
  void ChangePageIndex(int NewPageIndex) {
    final _$actionInfo = _$_LeaderBoardViewModelBaseActionController
        .startAction(name: '_LeaderBoardViewModelBase.ChangePageIndex');
    try {
      return super.ChangePageIndex(NewPageIndex);
    } finally {
      _$_LeaderBoardViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
PageIndex: ${PageIndex},
pointLeaderBoardEntity: ${pointLeaderBoardEntity},
referenceLeaderBoardEntity: ${referenceLeaderBoardEntity}
    ''';
  }
}
