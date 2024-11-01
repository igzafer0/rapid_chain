import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:rapid_chain/config/base/view/base_view.dart';
import 'package:rapid_chain/config/data/shared_manager.dart';
import 'package:rapid_chain/injector.dart';
import 'package:rapid_chain/presentation/view/home/pages/flow/view_model/flow_view_model.dart';
import 'package:rapid_chain/presentation/view/widget/flow_post_widget/flow_post_widget.dart';
import 'package:rapid_chain/presentation/widget/divider/divider_global_widget.dart';
import 'package:rapid_chain/presentation/widget/image/network_image_global.dart';
import 'package:rapid_chain/presentation/widget/label/label_global_widget.dart';
import 'package:rapid_chain/util/constant/general_enum.dart';
import 'package:rapid_chain/util/constant/navigation_constant.dart';
import 'package:rapid_chain/util/enum/preference_key_enum.dart';
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
                    ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      child: SizedBox(
                        height: 40,
                        width: 40,
                        child: NetworkImageGlobal(
                            source: locator<SharedManager>()
                                .getStringValue(PreferenceKey.PROFILE_PICTURE)),
                      ),
                    ),
                    Gap(context.MidSpacer),
                    LabelGlobalWidget(
                      title: locator<SharedManager>()
                          .getStringValue(PreferenceKey.NAME),
                      fontSize: FONT_SIZE.TITLE_LARGE,
                      fontWeight: FontWeight.w800,
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () =>
                          context.pushNamed(NavigationConstant.SETTINGS),
                      child: const Icon(
                        Icons.settings,
                        size: 30,
                      ),
                    )
                  ],
                ),
              ),
              Gap(context.MidSpacer),
              const DividerGlobalWidget(),
              Gap(context.LargeSpacer),
              Observer(builder: (context) {
                if (value.flow == null) {
                  return const SizedBox.shrink();
                }
                return Expanded(
                  child: ListView.builder(
                    itemCount: value.flow!.length,
                    itemBuilder: (context, index) {
                      return FlowPostWidget(
                        onTap: () => value.like(value.flow![index].id),
                        flowEntity: value.flow![index],
                      );
                    },
                  ),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
