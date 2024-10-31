import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:rapid_chain/presentation/widget/card/card_global_widget.dart';
import 'package:rapid_chain/presentation/widget/label/label_global_widget.dart';
import 'package:rapid_chain/util/constant/general_enum.dart';
import 'package:rapid_chain/util/extension/design_extension/edge_insets_extension.dart';
import 'package:rapid_chain/util/extension/design_extension/spacer_extension.dart';

class LeaderBoardTabWidget extends StatelessWidget {
  final int PageIndex;
  final Function(int) newIndex;

  const LeaderBoardTabWidget(
      {required this.PageIndex, required this.newIndex, super.key});

  @override
  Widget build(BuildContext context) {
    return CardGlobalWidget(
      child: Padding(
        padding: context.MidAllEdgeInsets,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () => newIndex(0),
                child: CardGlobalWidget(
                  color: PageIndex == 0
                      ? APPLICATION_COLOR.BACKGROUND
                      : APPLICATION_COLOR.PRIMARY,
                  child: const SizedBox(
                    height: 50,
                    child: Center(
                      child: LabelGlobalWidget(title: "Point"),
                    ),
                  ),
                ),
              ),
            ),
            Gap(context.MidSpacer),
            Expanded(
              child: GestureDetector(
                onTap: () => newIndex(1),
                child: CardGlobalWidget(
                  color: PageIndex == 0
                      ? APPLICATION_COLOR.PRIMARY
                      : APPLICATION_COLOR.BACKGROUND,
                  child: const SizedBox(
                    height: 50,
                    child: Center(
                      child: LabelGlobalWidget(title: "References"),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
