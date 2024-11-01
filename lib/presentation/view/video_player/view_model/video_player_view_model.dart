import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobx/mobx.dart';
import 'package:rapid_chain/config/base/view_model/base_view_model.dart';
import 'package:video_player/video_player.dart';
part 'video_player_view_model.g.dart';

class VideoPlayerViewModel = _VideoPlayerViewModelBase
    with _$VideoPlayerViewModel;

abstract class _VideoPlayerViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => viewModelContext = context;
  @override
  void init() {
    controller.addListener(_listeners);
  }

  @observable
  bool isVideoPlaying = true;
  @observable
  double currentPosition = 0;
  @observable
  double oldPosition = -1;

  @action
  onChanging(double value) {
    _autoToggleOpacity();
    currentPosition = value;
  }

  void pop() {
    viewModelContext.pop();
    controller.removeListener(_listeners);
    controller.dispose();
  }

  toggleVideo() {
    if (isOpacityFull) {
      isVideoPlaying ? controller.pause() : controller.play();
    }
    _autoToggleOpacity();
  }

  onChangeStart() {
    if (isOpacityFull) {
      controller.pause();
    }
  }

  @observable
  bool isOpacityFull = false;

  Timer? _timer;

  @action
  void _autoToggleOpacity() {
    _timer?.cancel();
    isOpacityFull = true;
    _timer =
        Timer(const Duration(milliseconds: 2500), () => isOpacityFull = false);
  }

  @action
  void toggleOpacity() {
    _timer?.cancel();
    isOpacityFull = !isOpacityFull;
    _timer =
        Timer(const Duration(milliseconds: 2500), () => isOpacityFull = false);
  }

  late VideoPlayerController controller;

  onChangeEnd(double lastPosition) {
    if (isOpacityFull) {
      currentPosition = lastPosition;
      controller.seekTo(Duration(seconds: lastPosition.toInt()));
      oldPosition = lastPosition;
      controller.play();
    }
  }

  seekTo(int seekTo) {
    if (isOpacityFull) {
      controller.play();
      if (currentPosition + seekTo <= 0) {
        controller.seekTo(Duration.zero);
      } else if (currentPosition + seekTo >=
          controller.value.duration.inSeconds) {
        controller
            .seekTo(Duration(seconds: controller.value.duration.inSeconds));
      } else {
        controller.seekTo(
            Duration(seconds: (currentPosition.toInt() + seekTo.toInt())));
      }
    }
    _autoToggleOpacity();
  }

  @action
  void _listeners() {
    currentPosition = controller.value.position.inSeconds * 1.0;
    isVideoPlaying = controller.value.isPlaying;
  }

  Timer? counter;
}
