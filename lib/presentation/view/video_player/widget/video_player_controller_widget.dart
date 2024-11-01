import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:rapid_chain/presentation/view/video_player/view_model/video_player_view_model.dart';
import 'package:rapid_chain/util/constant/general_enum.dart';
import 'package:rapid_chain/util/extension/theme_extension.dart';

class VideoPlayerControllerWidget extends StatelessWidget {
  final VideoPlayerViewModel viewModel;
  const VideoPlayerControllerWidget({required this.viewModel, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () => viewModel.seekTo(-10),
              child: CircleAvatar(
                  maxRadius: 24,
                  child: Icon(
                    size: 22,
                    Icons.replay_10,
                    color: context.toColor(APPLICATION_COLOR.LIGHT),
                  )),
            ),
          ),
          Expanded(
            flex: 1,
            child: Observer(
              builder: (context) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () => viewModel.toggleVideo(),
                      child: CircleAvatar(
                        maxRadius: 28,
                        child: viewModel.isVideoPlaying
                            ? Icon(
                                Icons.pause,
                                color: context.toColor(APPLICATION_COLOR.LIGHT),
                              )
                            : Icon(
                                Icons.play_arrow,
                                color: context.toColor(APPLICATION_COLOR.LIGHT),
                              ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () => viewModel.seekTo(10),
              child: CircleAvatar(
                maxRadius: 24,
                child: Icon(
                  color: context.toColor(APPLICATION_COLOR.LIGHT),
                  Icons.forward_10,
                  size: 22,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
