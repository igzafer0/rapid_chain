import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:rapid_chain/config/base/view/base_view.dart';
import 'package:rapid_chain/presentation/view/video_player/view_model/video_player_view_model.dart';
import 'package:rapid_chain/presentation/view/video_player/widget/video_player_controller_widget.dart';
import 'package:rapid_chain/presentation/widget/slider/no_padding_slider.dart';
import 'package:rapid_chain/util/constant/general_enum.dart';
import 'package:rapid_chain/util/extension/design_extension/edge_insets_extension.dart';
import 'package:rapid_chain/util/extension/theme_extension.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerView extends StatefulWidget {
  final String url;
  const VideoPlayerView({required this.url, super.key});

  @override
  State<VideoPlayerView> createState() => _VideoPlayerViewState();
}

class _VideoPlayerViewState extends State<VideoPlayerView> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.url))
      ..initialize().then((_) {
        setState(() {
          _controller.play();
        });
      });
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<VideoPlayerViewModel>(
      viewModel: VideoPlayerViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.controller = _controller;
        model.init();
      },
      onPageBuilder: (BuildContext context, VideoPlayerViewModel value) =>
          Scaffold(
        body: Stack(
          children: [
            Center(
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: VideoPlayer(_controller),
              ),
            ),
            Observer(
              builder: (context) => AnimatedOpacity(
                opacity: value.isOpacityFull ? 1 : 0,
                duration: const Duration(milliseconds: 100),
                child: Container(
                  color:
                      context.toColor(APPLICATION_COLOR.DARK).withOpacity(.7),
                ),
              ),
            ),
            GestureDetector(onTap: () => value.toggleOpacity()),
            Observer(builder: (_) {
              return Center(
                child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 100),
                    opacity: value.isOpacityFull ? 1 : 0,
                    child: VideoPlayerControllerWidget(viewModel: value)),
              );
            }),
            SafeArea(
              child: Observer(builder: (_) {
                return AnimatedOpacity(
                  duration: const Duration(milliseconds: 100),
                  opacity: value.isOpacityFull ? 1 : 0,
                  child: Padding(
                    padding: context.LargeHorizontalEdgeInsets,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: context.MidOnlyTopEdgeInsets,
                          child: GestureDetector(
                            onTap: () => value.pop(),
                            child: CircleAvatar(
                              maxRadius: 24,
                              child: Icon(
                                Icons.arrow_back_ios_new_sharp,
                                color: context.toColor(APPLICATION_COLOR.LIGHT),
                                size: 22,
                              ),
                            ),
                          ),
                        ),
                        NoPaddingSlider(
                          max: value.controller.value.duration.inSeconds
                                      .toDouble() ==
                                  0
                              ? 999
                              : value.controller.value.duration.inSeconds
                                  .toDouble(),
                          min: 0,
                          value: value.currentPosition,
                          changed: (e) => value.onChanging(e),
                          changeStart: () => value.onChangeStart(),
                          darkBackground: true,
                          changeEnd: (e) => value.onChangeEnd(e),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
