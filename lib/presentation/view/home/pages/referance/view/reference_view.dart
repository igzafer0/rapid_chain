import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:rapid_chain/config/base/view/base_view.dart';
import 'package:rapid_chain/config/data/shared_manager.dart';
import 'package:rapid_chain/injector.dart';
import 'package:rapid_chain/presentation/view/home/pages/referance/view_model/reference_view_model.dart';
import 'package:rapid_chain/presentation/view/home/pages/referance/widget/referenced_list_row_widget.dart';
import 'package:rapid_chain/presentation/widget/button/button_global_widget.dart';
import 'package:rapid_chain/presentation/widget/card/card_global_widget.dart';
import 'package:rapid_chain/presentation/widget/divider/divider_global_widget.dart';
import 'package:rapid_chain/presentation/widget/label/label_global_widget.dart';
import 'package:rapid_chain/util/constant/general_enum.dart';
import 'package:rapid_chain/util/enum/preference_key_enum.dart';
import 'package:rapid_chain/util/extension/design_extension/edge_insets_extension.dart';
import 'package:rapid_chain/util/extension/design_extension/spacer_extension.dart';
import 'package:share_plus/share_plus.dart';

class ReferenceView extends StatelessWidget {
  const ReferenceView({super.key});
  @override
  Widget build(BuildContext context) {
    return BaseView<ReferenceViewModel>(
      viewModel: ReferenceViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, ReferenceViewModel value) =>
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
                      Center(
                        child: LabelGlobalWidget(
                          title: locator<SharedManager>()
                              .getStringValue(PreferenceKey.reference_CODE),
                          letterSpace: 10,
                          fontSize: FONT_SIZE.DISPLAY_MEDIUM,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Gap(context.LargeSpacer),
                      ButtonGlobalWidget(
                        onTap: () async => await Share.share(
                            'My Rapid Chain reference code: ${locator<SharedManager>().getStringValue(PreferenceKey.reference_CODE)}'),
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
                    child: ReferencedListRowWidget(
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
