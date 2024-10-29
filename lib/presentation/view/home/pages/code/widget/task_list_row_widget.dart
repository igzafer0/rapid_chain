import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:rapid_chain/domain/entity/media/media_entity.dart';
import 'package:rapid_chain/presentation/widget/card/card_global_widget.dart';
import 'package:rapid_chain/presentation/widget/image/network_image_global.dart';
import 'package:rapid_chain/presentation/widget/label/label_global_widget.dart';
import 'package:rapid_chain/util/constant/general_enum.dart';
import 'package:rapid_chain/util/extension/design_extension/edge_insets_extension.dart';
import 'package:rapid_chain/util/extension/design_extension/spacer_extension.dart';

class TaskListRowWidget extends StatelessWidget {
  final String text;
  final int point;
  final MediaEntity cover;
  final bool collected;

  const TaskListRowWidget(
      {required this.text,
      required this.point,
      required this.cover,
      required this.collected,
      super.key});

  @override
  Widget build(BuildContext context) {
    return CardGlobalWidget(
      child: Opacity(
        opacity: collected ? 0.4 : 1,
        child: Padding(
          padding: context.LargeAllEdgeInsets,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                child: SizedBox(
                  height: 30,
                  width: 30,
                  child: NetworkImageGlobal(source: cover.url),
                ),
              ),
              Gap(context.MidSpacer),
              Expanded(child: LabelGlobalWidget(title: text)),
              Gap(context.LargeSpacer),
              LabelGlobalWidget(
                title: "+$point Points",
                fontWeight: FontWeight.w700,
                fontSize: FONT_SIZE.TITLE_SMALL,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
