import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gap/gap.dart';
import 'package:rapid_chain/config/base/view/base_view.dart';
import 'package:rapid_chain/presentation/view/home/pages/leader_board/view_model/leader_board_view_model.dart';
import 'package:rapid_chain/presentation/view/home/pages/leader_board/widget/leader_board_tab_widget.dart';
import 'package:rapid_chain/presentation/view/home/pages/leader_board/widget/tab/point_widget.dart';
import 'package:rapid_chain/presentation/view/home/pages/leader_board/widget/tab/referance_widget.dart';
import 'package:rapid_chain/util/extension/design_extension/edge_insets_extension.dart';
import 'package:rapid_chain/util/extension/design_extension/spacer_extension.dart';

class LeaderBoardView extends StatelessWidget {
  const LeaderBoardView({super.key});
  @override
  Widget build(BuildContext context) {
    return BaseView<LeaderBoardViewModel>(
      viewModel: LeaderBoardViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, LeaderBoardViewModel value) =>
          Scaffold(
        body: SafeArea(
          bottom: false,
          child: Padding(
            padding: context.MidHorizontalEdgeInsets,
            child: Column(
              children: [
                Observer(builder: (context) {
                  if (value.PageIndex == -1) {
                    return const SizedBox.shrink();
                  }
                  return LeaderBoardTabWidget(
                    PageIndex: value.PageIndex,
                    newIndex: (p0) => value.ChangePageIndex(p0),
                  );
                }),
                Gap(context.MidSpacer),
                Expanded(
                  child: Observer(
                    builder: (context) {
                      if (value.PageIndex == 0) {
                        return const PointWidget();
                      }
                      return const ReferanceWidget();
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
