import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:rapid_chain/presentation/widget/image/network_image_global.dart';
import 'package:rapid_chain/presentation/widget/label/label_global_md_widget.dart';
import 'package:rapid_chain/presentation/widget/label/label_global_widget.dart';
import 'package:rapid_chain/util/constant/general_enum.dart';
import 'package:rapid_chain/util/extension/design_extension/edge_insets_extension.dart';
import 'package:rapid_chain/util/extension/design_extension/size_extension.dart';
import 'package:rapid_chain/util/extension/design_extension/spacer_extension.dart';

class FlowPostWidget extends StatelessWidget {
  const FlowPostWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: context.MidHorizontalEdgeInsets,
          child: Row(
            children: [
              const ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                child: SizedBox(
                  width: 40,
                  height: 40,
                  child: NetworkImageGlobal(
                      fit: BoxFit.cover,
                      source:
                          "https://www.gurkangurkan.com/Resources/Press/ImageFile/8_m.jpg"),
                ),
              ),
              Gap(context.MidSpacer),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LabelGlobalWidget(
                    title: "Rapid Chain",
                    fontSize: FONT_SIZE.TITLE_MEDIUM,
                    fontWeight: FontWeight.w800,
                  ),
                  LabelGlobalWidget(
                    title: "14 October 2024",
                    textColor: APPLICATION_COLOR.SUBTITLE,
                    fontSize: FONT_SIZE.BODY_SMALL,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
            ],
          ),
        ),
        Gap(context.LargeSpacer),
        SizedBox(
          width: context.ScreenWidth,
          child: const AspectRatio(
            aspectRatio: 1,
            child: NetworkImageGlobal(
                source:
                    "https://www.gurkangurkan.com/Resources/Press/ImageFile/8_m.jpg"),
          ),
        ),
        Gap(context.LargeSpacer),
        Padding(
          padding: context.MidHorizontalEdgeInsets,
          child: Row(
            children: [
              const Icon(Icons.favorite_border, size: 32),
              Gap(context.LargeSpacer),
              const Icon(Icons.forum, size: 32),
            ],
          ),
        ),
        Gap(context.MidSpacer),
        Padding(
          padding: context.MidHorizontalEdgeInsets,
          child: const LabelGlobalWidget(
            title: "1200 like",
            fontSize: FONT_SIZE.TITLE_SMALL,
            fontWeight: FontWeight.w700,
          ),
        ),
        Padding(
          padding: context.MidHorizontalEdgeInsets,
          child: const LabelGlobalMdWidget(
            title:
                "*Rapid Chain* Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet",
            fontSize: FONT_SIZE.TITLE_SMALL,
          ),
        ),
        Gap(context.SmallSpacer),
        Padding(
          padding: context.MidHorizontalEdgeInsets,
          child: const LabelGlobalWidget(
            title: "See other comments",
            fontSize: FONT_SIZE.TITLE_SMALL,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
