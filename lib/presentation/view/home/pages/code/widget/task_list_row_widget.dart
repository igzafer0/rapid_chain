import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:rapid_chain/presentation/widget/card/card_global_widget.dart';
import 'package:rapid_chain/presentation/widget/image/network_image_global.dart';
import 'package:rapid_chain/presentation/widget/label/label_global_widget.dart';
import 'package:rapid_chain/util/constant/general_enum.dart';
import 'package:rapid_chain/util/extension/design_extension/edge_insets_extension.dart';
import 'package:rapid_chain/util/extension/design_extension/spacer_extension.dart';

class TaskListRowWidget extends StatelessWidget {
  final String text;
  const TaskListRowWidget({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return CardGlobalWidget(
      child: Padding(
        padding: context.LargeAllEdgeInsets,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              child: SizedBox(
                height: 30,
                width: 30,
                child: NetworkImageGlobal(
                    source:
                        "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Instagram_icon.png/600px-Instagram_icon.png"),
              ),
            ),
            Gap(context.LargeSpacer),
            const Expanded(
                child: LabelGlobalWidget(
                    title: "Follow us from Instagram asfa fsdf sdf s")),
            Gap(context.LargeSpacer),
            const LabelGlobalWidget(
              title: "+20 Points",
              fontWeight: FontWeight.w700,
              fontSize: FONT_SIZE.TITLE_MEDIUM,
            ),
          ],
        ),
      ),
    );
  }
}
