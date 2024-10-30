import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:rapid_chain/presentation/widget/button/button_global_widget.dart';
import 'package:rapid_chain/presentation/widget/card/card_global_widget.dart';
import 'package:rapid_chain/presentation/widget/label/label_global_md_widget.dart';
import 'package:rapid_chain/util/extension/design_extension/edge_insets_extension.dart';
import 'package:rapid_chain/util/extension/design_extension/size_extension.dart';
import 'package:rapid_chain/util/extension/design_extension/spacer_extension.dart';

class CollectDialogWidget extends StatelessWidget {
  const CollectDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.MidAllEdgeInsets,
      child: Center(
        child: CardGlobalWidget(
            child: Container(
          padding: context.LargeVerticalEdgeInsets,
          width: context.ScreenWidth,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: context.LargeHorizontalEdgeInsets,
                child: const LabelGlobalMdWidget(
                    align: TextAlign.center,
                    title:
                        "You haven't received your daily login reward. You can collect your daily reward by clicking the *Collect button.*"),
              ),
              Gap(context.LargeSpacer),
              Padding(
                padding: context.LargeHorizontalEdgeInsets,
                child: ButtonGlobalWidget(
                  onTap: () => context.pop(),
                  text: "Collect",
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
