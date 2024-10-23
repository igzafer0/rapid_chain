import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:rapid_chain/config/base/view/base_view.dart';
import 'package:rapid_chain/presentation/view/home/pages/referance/view_model/referance_view_model.dart';
import 'package:rapid_chain/presentation/view/home/pages/referance/widget/referanced_list_row_widget.dart';
import 'package:rapid_chain/presentation/widget/button/button_global_widget.dart';
import 'package:rapid_chain/presentation/widget/card/card_global_widget.dart';
import 'package:rapid_chain/presentation/widget/divider/divider_global_widget.dart';
import 'package:rapid_chain/presentation/widget/label/label_global_widget.dart';
import 'package:rapid_chain/util/constant/general_enum.dart';
import 'package:rapid_chain/util/extension/design_extension/edge_insets_extension.dart';
import 'package:rapid_chain/util/extension/design_extension/spacer_extension.dart';

class ReferanceView extends StatelessWidget {
  const ReferanceView({super.key});
  @override
  Widget build(BuildContext context) {
    return BaseView<ReferanceViewModel>(
      viewModel: ReferanceViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, ReferanceViewModel value) =>
          Scaffold(
        body: SafeArea(
          bottom: false,
          child: ListView(
            padding: context.MidHorizontalEdgeInsets,
            children: [
              CardGlobalWidget(
                child: Padding(
                  padding: context.LargeAllEdgeInsets,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const LabelGlobalWidget(
                          title:
                              "You can earn extra points by sharing the code with your friends."),
                      Gap(context.LargeSpacer),
                      const Center(
                        child: LabelGlobalWidget(
                          title: "1QJU2L",
                          letterSpace: 10,
                          fontSize: FONT_SIZE.DISPLAY_MEDIUM,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Gap(context.LargeSpacer),
                      ButtonGlobalWidget(
                        onTap: () => {},
                        text: "Share",
                      )
                    ],
                  ),
                ),
              ),
              Gap(context.LargeSpacer),
              const DividerGlobalWidget(),
              Gap(context.LargeSpacer),
              const LabelGlobalWidget(
                title: "Friends",
                fontWeight: FontWeight.w800,
                fontSize: FONT_SIZE.HEADLINE_LARGE,
              ),
              const LabelGlobalWidget(
                title: "Users who registered with your referral code.",
                fontWeight: FontWeight.w400,
                textColor: APPLICATION_COLOR.SUBTITLE,
                fontSize: FONT_SIZE.BODY_MEDIUM,
              ),
              Gap(context.LargeSpacer),
              ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    margin: context.MidOnlyBottomEdgeInsets,
                    child: ReferancedListRowWidget(
                      text: "indexo: $index",
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
