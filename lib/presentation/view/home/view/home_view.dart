import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:rapid_chain/config/base/view/base_view.dart';
import 'package:rapid_chain/presentation/view/home/pages/code/view/code_view.dart';
import 'package:rapid_chain/presentation/view/home/pages/flow/view/flow_view.dart';
import 'package:rapid_chain/presentation/view/home/pages/leader_board/view/leader_board_view.dart';
import 'package:rapid_chain/presentation/view/home/pages/referance/view/referance_view.dart';
import 'package:rapid_chain/presentation/view/home/view_model/home_view_model.dart';
import 'package:rapid_chain/presentation/widget/card/card_global_widget.dart';
import 'package:rapid_chain/util/constant/general_enum.dart';
import 'package:rapid_chain/util/extension/design_extension/edge_insets_extension.dart';
import 'package:rapid_chain/util/extension/design_extension/size_extension.dart';
import 'package:rapid_chain/util/extension/theme_extension.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      viewModel: HomeViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, HomeViewModel value) => Scaffold(
        body: Observer(builder: (context) {
          if (value.PageIndex == -1) {
            return const SizedBox.shrink();
          }
          return Column(
            children: [
              Expanded(child: Builder(builder: (context) {
                if (value.PageIndex == 0) {
                  return const FlowView();
                } else if (value.PageIndex == 1) {
                  return const LeaderBoardView();
                } else if (value.PageIndex == 2) {
                  return const CodeView();
                } else if (value.PageIndex == 3) {
                  return const ReferanceView();
                }
                return Container();
              })),
              Container(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).padding.bottom + 10,
                  left: 5,
                  right: 5,
                  top: 10,
                ),
                color: context.toColor(APPLICATION_COLOR.PRIMARY),
                child: Row(
                    children: value.PageIcon.map((e) {
                  Map<int, Widget> data = e;
                  if (data.keys.first == value.PageIndex) {
                    return CardGlobalWidget(
                      color: APPLICATION_COLOR.BACKGROUND,
                      child: Container(
                        padding: context.MidVerticalEdgeInsets,
                        width: (context.ScreenWidth / 5) - 2,
                        child: data.values.first,
                      ),
                    );
                  }
                  return GestureDetector(
                      onTap: () => value.ChangePageIndex(data.keys.first),
                      child: Container(
                        color: context.toColor(APPLICATION_COLOR.PRIMARY),
                        width: (context.ScreenWidth / 5) - 2,
                        child: data.values.first,
                      ));
                }).toList()),
              )
            ],
          );
        }),
      ),
    );
  }
}
