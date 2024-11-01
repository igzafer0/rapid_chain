// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reference_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ReferenceViewModel on _ReferenceViewModelBase, Store {
  late final _$userListAtom =
      Atom(name: '_ReferenceViewModelBase.userList', context: context);

  @override
  List<MyReferenceUserEntity>? get userList {
    _$userListAtom.reportRead();
    return super.userList;
  }

  @override
  set userList(List<MyReferenceUserEntity>? value) {
    _$userListAtom.reportWrite(value, super.userList, () {
      super.userList = value;
    });
  }

  late final _$_myReferenceListAsyncAction =
      AsyncAction('_ReferenceViewModelBase._myReferenceList', context: context);

  @override
  Future<void> _myReferenceList() {
    return _$_myReferenceListAsyncAction.run(() => super._myReferenceList());
  }

  @override
  String toString() {
    return '''
userList: ${userList}
    ''';
  }
}
