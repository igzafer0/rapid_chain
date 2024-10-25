import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:rapid_chain/presentation/widget/label/label_global_widget.dart';
import 'package:rapid_chain/presentation/widget/text_field/text_field_global_widget.dart';
import 'package:rapid_chain/util/enum/input_type.dart';
import 'package:rapid_chain/util/extension/design_extension/spacer_extension.dart';

class LastAttempWidget extends StatelessWidget {
  final Function(String) WalletAddress;
  final Function(String) Password;

  const LastAttempWidget(
      {required this.WalletAddress, required this.Password, super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Gap(context.MidSpacer),
        const LabelGlobalWidget(title: "Password"),
        Gap(context.MidSpacer),
        TextFieldGlobalWidget(
            inputType: InputType.PASSWORD, newText: (e) => Password(e)),
        Gap(context.MidSpacer),
        const LabelGlobalWidget(title: "Password Reply"),
        Gap(context.MidSpacer),
        TextFieldGlobalWidget(
            inputType: InputType.PASSWORD, newText: (e) => Password(e)),
        Gap(context.MidSpacer),
      ],
    );
  }
}
