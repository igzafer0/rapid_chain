import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:rapid_chain/domain/entity/leader_board/reference_leader_board_entity.dart';
import 'package:rapid_chain/presentation/view/home/pages/leader_board/widget/reference_leader_board_list_row_widget.dart';
import 'package:rapid_chain/presentation/widget/card/card_global_widget.dart';
import 'package:rapid_chain/presentation/widget/label/label_global_md_widget.dart';
import 'package:rapid_chain/presentation/widget/label/label_global_widget.dart';
import 'package:rapid_chain/util/constant/general_enum.dart';
import 'package:rapid_chain/util/extension/design_extension/edge_insets_extension.dart';
import 'package:rapid_chain/util/extension/design_extension/spacer_extension.dart';

class ReferenceWidget extends StatefulWidget {
  final ReferenceLeaderBoardEntity entity;

  const ReferenceWidget({required this.entity, super.key});

  @override
  State<ReferenceWidget> createState() => _ReferenceWidgetState();
}

class _ReferenceWidgetState extends State<ReferenceWidget> {
  late ScrollController controller;
  @override
  void initState() {
    super.initState();
    controller = ScrollController()..addListener(_scrollListener);
  }

  @override
  void dispose() {
    controller.removeListener(_scrollListener);
    super.dispose();
  }

  void _scrollListener() {
    if (controller.position.extentAfter < 500) {
      // setState(() {
      //   items.addAll(List.generate(50, (index) => 'Inserted $index'));
      // });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      controller: controller,
      children: [
        LabelGlobalMdWidget(
          title:
              "With *${widget.entity.userReference}* references, you are ranked *${widget.entity.userRank}* out of *${widget.entity.references.length}* users.",
          textColor: APPLICATION_COLOR.SUBTITLE,
          fontWeight: FontWeight.w500,
        ),
        Gap(context.MidSpacer),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: CardGlobalWidget(
                child: SizedBox(
                  height: 60,
                  child: Center(
                    child: LabelGlobalWidget(
                      title: "#${widget.entity.userReference}",
                      fontSize: FONT_SIZE.HEADLINE_SMALL,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
            Gap(context.MidSpacer),
            Expanded(
              child: CardGlobalWidget(
                child: SizedBox(
                  height: 60,
                  child: Center(
                    child: LabelGlobalWidget(
                      title: "${widget.entity.userRank}",
                      fontSize: FONT_SIZE.HEADLINE_SMALL,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Gap(context.MidSpacer),
        const LabelGlobalWidget(
          title: "Only the first 1000 users are listed...",
          textColor: APPLICATION_COLOR.SUBTITLE,
          fontSize: FONT_SIZE.BODY_SMALL,
          fontWeight: FontWeight.w700,
        ),
        Gap(context.MidSpacer),
        ListView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: widget.entity.references.length,
          itemBuilder: (context, index) {
            return Container(
              margin: context.MidOnlyBottomEdgeInsets,
              child: ReferenceLeaderBoardListRowWidget(
                entity: widget.entity.references[index],
              ),
            );
          },
        )
      ],
    );
  }
}
