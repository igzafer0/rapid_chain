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
PageIndex: ${PageIndex}
    ''';
  }
}
