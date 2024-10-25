import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:rapid_chain/presentation/widget/label/label_global_widget.dart';
import 'package:rapid_chain/presentation/widget/text_field/text_field_global_widget.dart';
import 'package:rapid_chain/util/enum/input_type.dart';
import 'package:rapid_chain/util/extension/design_extension/spacer_extension.dart';

class NameSurnameAttempWidget extends StatelessWidget {
  final Function(String) Name;
  final Function(String) Surname;
  final Function(String) Nickname;
  final Function(String) Password;

  const NameSurnameAttempWidget(
      {required this.Name,
      required this.Surname,
      required this.Nickname,
      required this.Password,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const LabelGlobalWidget(title: "Name"),
                  Gap(context.MidSpacer),
                  TextFieldGlobalWidget(
                    newText: (e) => Name(e),
                    inputType: InputType.MAIL,
                  ),
                ],
              ),
            ),
            Gap(context.MidSpacer),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const LabelGlobalWidget(title: "Surname"),
                  Gap(context.MidSpacer),
                  TextFieldGlobalWidget(
                    newText: (e) => Surname(e),
                    inputType: InputType.MAIL,
                  ),
                ],
              ),
            ),
          ],
        ),
        Gap(context.MidSpacer),
        const LabelGlobalWidget(title: "Nickname"),
        Gap(context.MidSpacer),
        TextFieldGlobalWidget(
          newText: (e) => Nickname(e),
          inputType: InputType.MAIL,
        ),
        Gap(context.MidSpacer),
        const LabelGlobalWidget(title: "Wallet Adress"),
        Gap(context.MidSpacer),
        TextFieldGlobalWidget(
            inputType: InputType.TEXT, newText: (e) => " WalletAddress(e)"),
        Gap(context.MidSpacer),
        const LabelGlobalWidget(title: "Password"),
        Gap(context.MidSpacer),
        TextFieldGlobalWidget(
            inputType: InputType.PASSWORD, newText: (e) => Password(e)),
        Gap(context.MidSpacer),
      ],
    );
  }
}
