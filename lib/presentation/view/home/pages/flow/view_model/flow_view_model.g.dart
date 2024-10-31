// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flow_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FlowViewModel on _FlowViewModelBase, Store {
  late final _$flowAtom =
      Atom(name: '_FlowViewModelBase.flow', context: context);

  @override
  List<FlowEntity>? get flow {
    _$flowAtom.reportRead();
    return super.flow;
  }

  @override
  set flow(List<FlowEntity>? value) {
    _$flowAtom.reportWrite(value, super.flow, () {
      super.flow = value;
    });
  }

  late final _$_getFlowDataAsyncAction =
      AsyncAction('_FlowViewModelBase._getFlowData', context: context);

  @override
  Future<void> _getFlowData() {
    return _$_getFlowDataAsyncAction.run(() => super._getFlowData());
  }

  @override
  String toString() {
    return '''
flow: ${flow}
    ''';
  }
}
