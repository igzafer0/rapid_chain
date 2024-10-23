import 'package:flutter/material.dart';
import 'package:rapid_chain/presentation/widget/card/card_global_widget.dart';
import 'package:rapid_chain/presentation/widget/image/network_image_global.dart';
import 'package:rapid_chain/presentation/widget/label/label_global_widget.dart';
import 'package:rapid_chain/util/extension/design_extension/edge_insets_extension.dart';

class LeaderBoardListRowWidget extends StatelessWidget {
  final String text;
  const LeaderBoardListRowWidget({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return CardGlobalWidget(
      child: Padding(
        padding: context.LargeAllEdgeInsets,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(23)),
              child: SizedBox(
                height: 45,
                width: 45,
                child: NetworkImageGlobal(
                    source:
                        "https://raw.githubusercontent.com/Volosh1n/github-avatars/master/examples/image.png"),
              ),
            ),
            LabelGlobalWidget(title: text),
            const LabelGlobalWidget(title: "120.000"),
          ],
        ),
      ),
    );
  }
}
