import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:rapid_chain/config/base/view/base_view.dart';
import 'package:rapid_chain/presentation/view/setting/view_model/setting_view_model.dart';
import 'package:rapid_chain/presentation/view/setting/widget/setting_list_row_widget.dart';
import 'package:rapid_chain/presentation/widget/divider/divider_global_widget.dart';
import 'package:rapid_chain/presentation/widget/label/label_global_widget.dart';
import 'package:rapid_chain/util/constant/general_enum.dart';
import 'package:rapid_chain/util/extension/design_extension/edge_insets_extension.dart';
import 'package:rapid_chain/util/extension/design_extension/spacer_extension.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});
  @override
  Widget build(BuildContext context) {
    return BaseView<SettingViewModel>(
      viewModel: SettingViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, SettingViewModel value) => Scaffold(
        body: SafeArea(
          bottom: false,
          child: ListView(
            padding: context.MidHorizontalEdgeInsets,
            children: [
              const LabelGlobalWidget(
                title: "Profile",
                fontWeight: FontWeight.w800,
                fontSize: FONT_SIZE.HEADLINE_LARGE,
              ),
              const LabelGlobalWidget(
                title: "Profile settings",
                fontWeight: FontWeight.w400,
                textColor: APPLICATION_COLOR.SUBTITLE,
                fontSize: FONT_SIZE.BODY_MEDIUM,
              ),
              Gap(context.MidSpacer),
              const SettingListRowWidget(text: "Mail Adresi"),
              Gap(context.MidSpacer),
              const SettingListRowWidget(text: "Cüzdan Adresi"),
              Gap(context.MidSpacer),
              GestureDetector(
                  onTap: () => value.logOut(),
                  child: const SettingListRowWidget(text: "Çıkış Yap")),
              Gap(context.LargeSpacer),
              const DividerGlobalWidget(),
              Gap(context.LargeSpacer),
              const LabelGlobalWidget(
                title: "Legal",
                fontWeight: FontWeight.w800,
                fontSize: FONT_SIZE.HEADLINE_LARGE,
              ),
              const LabelGlobalWidget(
                title: "Legal Agreements stuff",
                fontWeight: FontWeight.w400,
                textColor: APPLICATION_COLOR.SUBTITLE,
                fontSize: FONT_SIZE.BODY_MEDIUM,
              ),
              Gap(context.MidSpacer),
              const SettingListRowWidget(text: "Privacy Policy"),
              Gap(context.MidSpacer),
              const SettingListRowWidget(text: "User Agreement"),
              Gap(context.MidSpacer),
              const SettingListRowWidget(text: "Terms of Use"),
              Gap(context.LargeSpacer),
              const DividerGlobalWidget()
            ],
          ),
        ),
      ),
    );
  }
}
