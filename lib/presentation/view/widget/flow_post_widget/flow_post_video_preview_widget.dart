import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rapid_chain/domain/entity/media/media_entity.dart';
import 'package:rapid_chain/presentation/widget/image/network_image_global.dart';
import 'package:rapid_chain/util/constant/general_enum.dart';
import 'package:rapid_chain/util/constant/navigation_constant.dart';
import 'package:rapid_chain/util/extension/theme_extension.dart';
import 'package:video_player/video_player.dart';

class FlowPostVideoPreviewWidget extends StatefulWidget {
  final MediaEntity source;
  const FlowPostVideoPreviewWidget({required this.source, super.key});

  @override
  State<FlowPostVideoPreviewWidget> createState() =>
      _FlowPostVideoPreviewWidgetState();
}

class _FlowPostVideoPreviewWidgetState
    extends State<FlowPostVideoPreviewWidget> {
  late VideoPlayerController _controller;
  bool videoLoaded = false;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.source.url))
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return !videoLoaded
        ? GestureDetector(
            onTap: () => setState(() {
              videoLoaded = true;
              _controller.play();
            }),
            child: Stack(
              children: [
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: NetworkImageGlobal(
                      source: widget.source.mediaMetaData.thumbnail),
                ),
                Center(
                  child: CircleAvatar(
                    maxRadius: 24,
                    child: Icon(
                      color: context.toColor(APPLICATION_COLOR.LIGHT),
                      Icons.play_arrow,
                      size: 32,
                    ),
                  ),
                )
              ],
            ),
          )
        : _controller.value.isInitialized
            ? GestureDetector(
                onTap: () {
                  _controller.value.isPlaying
                      ? _controller.pause()
                      : _controller.play();
                  setState(() {});
                },
                child: Stack(
                  children: [
                    Center(
                      child: AspectRatio(
                        aspectRatio: 16 / 9,
                        child: VideoPlayer(_controller),
                      ),
                    ),
                    !_controller.value.isPlaying
                        ? Center(
                            child: CircleAvatar(
                              maxRadius: 24,
                              child: Icon(
                                color: context.toColor(APPLICATION_COLOR.LIGHT),
                                Icons.play_arrow,
                                size: 32,
                              ),
                            ),
                          )
                        : const SizedBox.shrink(),
                    Positioned(
                      bottom: 10,
                      right: 10,
                      child: GestureDetector(
                        onTap: () {
                          _controller.pause();
                          context.pushNamed(NavigationConstant.VIDEO_PLAYER,
                              pathParameters: {"videoUrl": widget.source.url});
                        },
                        child: CircleAvatar(
                          maxRadius: 16,
                          child: Icon(
                            color: context.toColor(APPLICATION_COLOR.LIGHT),
                            Icons.fullscreen,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : const SizedBox.shrink();
  }
}
