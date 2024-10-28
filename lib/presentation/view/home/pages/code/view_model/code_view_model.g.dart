// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'code_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CodeViewModel on _CodeViewModelBase, Store {
  late final _$taskListAtom =
      Atom(name: '_CodeViewModelBase.taskList', context: context);

  @override
  List<TaskEntity> get taskList {
    _$taskListAtom.reportRead();
    return super.taskList;
  }

  @override
  set taskList(List<TaskEntity> value) {
    _$taskListAtom.reportWrite(value, super.taskList, () {
      super.taskList = value;
    });
  }

  late final _$_taskListAsyncAction =
      AsyncAction('_CodeViewModelBase._taskList', context: context);

  @override
  Future<void> _taskList() {
    return _$_taskListAsyncAction.run(() => super._taskList());
  }

  @override
  String toString() {
    return '''
taskList: ${taskList}
    ''';
  }
}
