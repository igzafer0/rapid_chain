import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:rapid_chain/config/base/view/base_view.dart';
import 'package:rapid_chain/presentation/view/home/pages/flow/view_model/flow_view_model.dart';
import 'package:rapid_chain/presentation/view/widget/flow_post_widget/flow_post_widget.dart';
import 'package:rapid_chain/presentation/widget/image/network_image_global.dart';
import 'package:rapid_chain/presentation/widget/label/label_global_widget.dart';
import 'package:rapid_chain/util/constant/general_enum.dart';
import 'package:rapid_chain/util/extension/design_extension/edge_insets_extension.dart';
import 'package:rapid_chain/util/extension/design_extension/spacer_extension.dart';

class FlowView extends StatelessWidget {
  const FlowView({super.key});
  @override
  Widget build(BuildContext context) {
    return BaseView<FlowViewModel>(
      viewModel: FlowViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, FlowViewModel value) => Scaffold(
        body: SafeArea(
          bottom: false,
          child: Column(
            children: [
              Padding(
                padding: context.MidHorizontalEdgeInsets,
                child: Row(
                  children: [
                    const ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      child: SizedBox(
                        height: 40,
                        width: 40,
                        child: NetworkImageGlobal(
                            source:
                                "https://www.gurkangurkan.com/Resources/Press/ImageFile/8_m.jpg"),
                      ),
                    ),
                    Gap(context.MidSpacer),
                    const LabelGlobalWidget(
                      title: "Zafer Cetin",
                      fontSize: FONT_SIZE.HEADLINE_SMALL,
                      fontWeight: FontWeight.w700,
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.settings,
                      size: 30,
                    )
                  ],
                ),
              ),
              Gap(context.LargeSpacer),
              Expanded(
                child: ListView(
                  children: [
                    const FlowPostWidget(),
                    Gap(context.LargeSpacer),
                    const FlowPostWidget(),
                    Gap(context.LargeSpacer),
                    const FlowPostWidget(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
