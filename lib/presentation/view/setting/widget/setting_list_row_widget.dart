import 'package:flutter/material.dart';
import 'package:rapid_chain/presentation/widget/card/card_global_widget.dart';
import 'package:rapid_chain/presentation/widget/label/label_global_widget.dart';
import 'package:rapid_chain/util/constant/general_enum.dart';
import 'package:rapid_chain/util/extension/design_extension/edge_insets_extension.dart';

class SettingListRowWidget extends StatelessWidget {
  final String text;
  const SettingListRowWidget({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return CardGlobalWidget(
      child: Padding(
        padding: context.LargeAllEdgeInsets,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            LabelGlobalWidget(
              title: text,
              fontWeight: FontWeight.w700,
              fontSize: FONT_SIZE.TITLE_MEDIUM,
            ),
          ],
        ),
      ),
    );
  }
}
