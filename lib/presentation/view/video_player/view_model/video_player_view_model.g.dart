// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_player_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$VideoPlayerViewModel on _VideoPlayerViewModelBase, Store {
  late final _$isVideoPlayingAtom =
      Atom(name: '_VideoPlayerViewModelBase.isVideoPlaying', context: context);

  @override
  bool get isVideoPlaying {
    _$isVideoPlayingAtom.reportRead();
    return super.isVideoPlaying;
  }

  @override
  set isVideoPlaying(bool value) {
    _$isVideoPlayingAtom.reportWrite(value, super.isVideoPlaying, () {
      super.isVideoPlaying = value;
    });
  }

  late final _$currentPositionAtom =
      Atom(name: '_VideoPlayerViewModelBase.currentPosition', context: context);

  @override
  double get currentPosition {
    _$currentPositionAtom.reportRead();
    return super.currentPosition;
  }

  @override
  set currentPosition(double value) {
    _$currentPositionAtom.reportWrite(value, super.currentPosition, () {
      super.currentPosition = value;
    });
  }

  late final _$oldPositionAtom =
      Atom(name: '_VideoPlayerViewModelBase.oldPosition', context: context);

  @override
  double get oldPosition {
    _$oldPositionAtom.reportRead();
    return super.oldPosition;
  }

  @override
  set oldPosition(double value) {
    _$oldPositionAtom.reportWrite(value, super.oldPosition, () {
      super.oldPosition = value;
    });
  }

  late final _$isOpacityFullAtom =
      Atom(name: '_VideoPlayerViewModelBase.isOpacityFull', context: context);

  @override
  bool get isOpacityFull {
    _$isOpacityFullAtom.reportRead();
    return super.isOpacityFull;
  }

  @override
  set isOpacityFull(bool value) {
    _$isOpacityFullAtom.reportWrite(value, super.isOpacityFull, () {
      super.isOpacityFull = value;
    });
  }

  late final _$_VideoPlayerViewModelBaseActionController =
      ActionController(name: '_VideoPlayerViewModelBase', context: context);

  @override
  dynamic onChanging(double value) {
    final _$actionInfo = _$_VideoPlayerViewModelBaseActionController
        .startAction(name: '_VideoPlayerViewModelBase.onChanging');
    try {
      return super.onChanging(value);
    } finally {
      _$_VideoPlayerViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _autoToggleOpacity() {
    final _$actionInfo = _$_VideoPlayerViewModelBaseActionController
        .startAction(name: '_VideoPlayerViewModelBase._autoToggleOpacity');
    try {
      return super._autoToggleOpacity();
    } finally {
      _$_VideoPlayerViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleOpacity() {
    final _$actionInfo = _$_VideoPlayerViewModelBaseActionController
        .startAction(name: '_VideoPlayerViewModelBase.toggleOpacity');
    try {
      return super.toggleOpacity();
    } finally {
      _$_VideoPlayerViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _listeners() {
    final _$actionInfo = _$_VideoPlayerViewModelBaseActionController
        .startAction(name: '_VideoPlayerViewModelBase._listeners');
    try {
      return super._listeners();
    } finally {
      _$_VideoPlayerViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isVideoPlaying: ${isVideoPlaying},
currentPosition: ${currentPosition},
oldPosition: ${oldPosition},
isOpacityFull: ${isOpacityFull}
    ''';
  }
}
