import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:rapid_chain/config/base/view/base_view.dart';
import 'package:rapid_chain/presentation/view/home/pages/flow/view/flow_view.dart';
import 'package:rapid_chain/presentation/view/home/pages/leader_board/view/leader_board_view.dart';
import 'package:rapid_chain/presentation/view/home/view_model/home_view_model.dart';
import 'package:rapid_chain/presentation/widget/card/card_global_widget.dart';
import 'package:rapid_chain/util/constant/general_enum.dart';
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
                }
                return Container();
              })),
              Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).padding.bottom + 10,
                    top: 10,
                    left: 10,
                    right: 10),
                color: context.toColor(APPLICATION_COLOR.PRIMARY),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: value.PageIcon.map((e) {
                      Map<int, Widget> data = e;
                      if (data.keys.first == value.PageIndex) {
                        return CardGlobalWidget(
                          color: APPLICATION_COLOR.BACKGROUND,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 30),
                            child: data.values.first,
                          ),
                        );
                      }
                      return GestureDetector(
                          onTap: () => value.ChangePageIndex(data.keys.first),
                          child: data.values.first);
                    }).toList()),
              )
            ],
          );
        }),
      ),
    );
  }
}
