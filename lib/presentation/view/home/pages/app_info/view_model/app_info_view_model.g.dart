// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_info_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AppInfoViewModel on _AppInfoViewModelBase, Store {
  late final _$appInfoHtmlAtom =
      Atom(name: '_AppInfoViewModelBase.appInfoHtml', context: context);

  @override
  String get appInfoHtml {
    _$appInfoHtmlAtom.reportRead();
    return super.appInfoHtml;
  }

  @override
  set appInfoHtml(String value) {
    _$appInfoHtmlAtom.reportWrite(value, super.appInfoHtml, () {
      super.appInfoHtml = value;
    });
  }

  late final _$_getAppInfoAsyncAction =
      AsyncAction('_AppInfoViewModelBase._getAppInfo', context: context);

  @override
  Future<void> _getAppInfo() {
    return _$_getAppInfoAsyncAction.run(() => super._getAppInfo());
  }

  @override
  String toString() {
    return '''
appInfoHtml: ${appInfoHtml}
    ''';
  }
}
