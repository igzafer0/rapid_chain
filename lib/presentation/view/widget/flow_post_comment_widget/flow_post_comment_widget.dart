import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:rapid_chain/presentation/widget/card/card_global_widget.dart';
import 'package:rapid_chain/presentation/widget/image/network_image_global.dart';
import 'package:rapid_chain/presentation/widget/label/label_global_widget.dart';
import 'package:rapid_chain/util/constant/general_enum.dart';
import 'package:rapid_chain/util/extension/design_extension/edge_insets_extension.dart';
import 'package:rapid_chain/util/extension/design_extension/spacer_extension.dart';

class FlowPostCommentWidget extends StatelessWidget {
  const FlowPostCommentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CardGlobalWidget(
      child: Padding(
        padding: context.LargeAllEdgeInsets,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(13)),
              child: SizedBox(
                width: 25,
                height: 25,
                child: NetworkImageGlobal(
                    fit: BoxFit.cover,
                    source:
                        "https://www.gurkangurkan.com/Resources/Press/ImageFile/8_m.jpg"),
              ),
            ),
            Gap(context.MidSpacer),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const LabelGlobalWidget(
                    title: "Rapid Chain",
                    fontSize: FONT_SIZE.TITLE_MEDIUM,
                    fontWeight: FontWeight.w800,
                  ),
                  Gap(context.MidSpacer),
                  const LabelGlobalWidget(
                    title:
                        "*Rapid Chain* Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet",
                    fontSize: FONT_SIZE.TITLE_SMALL,
                  ),
                  Gap(context.SmallSpacer),
                  const LabelGlobalWidget(
                    title: "Reply",
                    fontSize: FONT_SIZE.TITLE_SMALL,
                    fontWeight: FontWeight.w700,
                  ),
                  Gap(context.LargeSpacer),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(13)),
                        child: SizedBox(
                          width: 25,
                          height: 25,
                          child: NetworkImageGlobal(
                              fit: BoxFit.cover,
                              source:
                                  "https://www.gurkangurkan.com/Resources/Press/ImageFile/8_m.jpg"),
                        ),
                      ),
                      Gap(context.MidSpacer),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const LabelGlobalWidget(
                              title: "Rapid Chain",
                              fontSize: FONT_SIZE.TITLE_MEDIUM,
                              fontWeight: FontWeight.w800,
                            ),
                            Gap(context.MidSpacer),
                            const LabelGlobalWidget(
                              title:
                                  "*Rapid Chain* Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet",
                              fontSize: FONT_SIZE.TITLE_SMALL,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
