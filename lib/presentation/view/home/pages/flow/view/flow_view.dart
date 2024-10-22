import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:rapid_chain/config/base/view/base_view.dart';
import 'package:rapid_chain/presentation/view/home/pages/flow/view_model/flow_view_model.dart';
import 'package:rapid_chain/presentation/view/widget/flow_post_widget/flow_post_widget.dart';
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
          child: ListView(
            children: [
              Gap(context.LargeSpacer),
              const FlowPostWidget(),
              Gap(context.LargeSpacer),
              const FlowPostWidget(),
              Gap(context.LargeSpacer),
              const FlowPostWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
