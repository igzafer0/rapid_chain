import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:rapid_chain/presentation/widget/button/button_global_widget.dart';
import 'package:rapid_chain/presentation/widget/card/card_global_widget.dart';
import 'package:rapid_chain/presentation/widget/label/label_global_widget.dart';
import 'package:rapid_chain/presentation/widget/text_field/text_field_global_widget.dart';
import 'package:rapid_chain/util/enum/input_type.dart';
import 'package:rapid_chain/util/extension/design_extension/edge_insets_extension.dart';
import 'package:rapid_chain/util/extension/design_extension/spacer_extension.dart';

class CodeClaimWidget extends StatefulWidget {
  final Function(String) code;
  const CodeClaimWidget({required this.code, super.key});

  @override
  State<CodeClaimWidget> createState() => _CodeClaimWidgetState();
}

class _CodeClaimWidgetState extends State<CodeClaimWidget> {
  String _code = "";

  @override
  Widget build(BuildContext context) {
    return CardGlobalWidget(
      child: Padding(
        padding: context.LargeAllEdgeInsets,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const LabelGlobalWidget(
                title:
                    "Lorem ipsum dolor sit amet. Ich bin test. Biqrue melzum saugza."),
            Gap(context.LargeSpacer),
            TextFieldGlobalWidget(
              key: Key("${DateTime.now().millisecondsSinceEpoch}"),
              newText: (e) => _code = e,
              hintText: "Enter Code",
              inputType: InputType.TEXT,
            ),
            Gap(context.LargeSpacer),
            ButtonGlobalWidget(
              onTap: () {
                setState(() {
                  widget.code(_code);
                });
              },
              text: "Claim",
            )
          ],
        ),
      ),
    );
  }
}
