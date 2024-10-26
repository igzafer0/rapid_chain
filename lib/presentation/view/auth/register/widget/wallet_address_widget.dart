import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:rapid_chain/presentation/widget/label/label_global_widget.dart';
import 'package:rapid_chain/presentation/widget/text_field/text_field_global_widget.dart';
import 'package:rapid_chain/util/enum/input_type.dart';
import 'package:rapid_chain/util/extension/design_extension/spacer_extension.dart';

class WalletAddressWidget extends StatelessWidget {
  final Function(String) WalletAddress;

  const WalletAddressWidget({required this.WalletAddress, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Gap(context.MidSpacer),
        const LabelGlobalWidget(title: "Wallet Adress"),
        Gap(context.MidSpacer),
        TextFieldGlobalWidget(
            inputType: InputType.TEXT, newText: (e) => WalletAddress(e)),
        Gap(context.MidSpacer),
      ],
    );
  }
}
