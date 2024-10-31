import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:rapid_chain/domain/entity/leader_board/point_leader_board_entity.dart';
import 'package:rapid_chain/presentation/view/home/pages/leader_board/widget/point_leader_board_list_row_widget.dart';
import 'package:rapid_chain/presentation/widget/card/card_global_widget.dart';
import 'package:rapid_chain/presentation/widget/label/label_global_md_widget.dart';
import 'package:rapid_chain/presentation/widget/label/label_global_widget.dart';
import 'package:rapid_chain/util/constant/general_enum.dart';
import 'package:rapid_chain/util/extension/design_extension/edge_insets_extension.dart';
import 'package:rapid_chain/util/extension/design_extension/spacer_extension.dart';

class PointWidget extends StatefulWidget {
  final PointLeaderBoardEntity entity;
  const PointWidget({required this.entity, super.key});

  @override
  State<PointWidget> createState() => _PointWidgetState();
}

class _PointWidgetState extends State<PointWidget> {
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
      // items.addAll(List.generate(50, (index) => 'Inserted $index'));
      // controller.removeListener(_scrollListener);
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
              "With *${widget.entity.userPoint}* points, you are ranked *${widget.entity.userRank}* out of *${widget.entity.points.length}* users.",
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
                      title: "#${widget.entity.userRank}",
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
                      title: "${widget.entity.userPoint}",
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
          itemCount: widget.entity.points.length,
          itemBuilder: (context, index) {
            return Container(
              margin: context.MidOnlyBottomEdgeInsets,
              child: PointLeaderBoardListRowWidget(
                user: widget.entity.points[index],
              ),
            );
          },
        )
      ],
    );
  }
}
