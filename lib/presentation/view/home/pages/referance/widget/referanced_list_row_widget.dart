import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:rapid_chain/presentation/widget/card/card_global_widget.dart';
import 'package:rapid_chain/presentation/widget/image/network_image_global.dart';
import 'package:rapid_chain/presentation/widget/label/label_global_widget.dart';
import 'package:rapid_chain/util/extension/design_extension/edge_insets_extension.dart';
import 'package:rapid_chain/util/extension/design_extension/spacer_extension.dart';

class ReferancedListRowWidget extends StatelessWidget {
  final String text;
  const ReferancedListRowWidget({required this.text, super.key});

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
              borderRadius: BorderRadius.all(Radius.circular(15)),
              child: SizedBox(
                height: 30,
                width: 30,
                child: NetworkImageGlobal(
                    source:
                        "https://www.gurkangurkan.com/Resources/Press/ImageFile/8_m.jpg"),
              ),
            ),
            Gap(context.LargeSpacer),
            const Expanded(child: LabelGlobalWidget(title: "Zafer Çetin")),
          ],
        ),
      ),
    );
  }
}
