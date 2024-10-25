import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:rapid_chain/presentation/widget/label/label_global_md_widget.dart';
import 'package:rapid_chain/presentation/widget/label/label_global_widget.dart';
import 'package:rapid_chain/presentation/widget/text_field/text_field_global_widget.dart';
import 'package:rapid_chain/util/constant/general_enum.dart';
import 'package:rapid_chain/util/enum/input_type.dart';
import 'package:rapid_chain/util/extension/design_extension/spacer_extension.dart';

class FirstAttempWidget extends StatelessWidget {
  final Function(String) Email;
  const FirstAttempWidget({required this.Email, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Gap(context.SmallSpacer),
        const LabelGlobalWidget(title: "E-mail"),
        Gap(context.MidSpacer),
        TextFieldGlobalWidget(
          inputType: InputType.MAIL,
          newText: (e) => Email(e),
        ),
        Gap(context.MidSpacer),
        const LabelGlobalMdWidget(
            fontSize: FONT_SIZE.BODY_MEDIUM,
            fontWeight: FontWeight.w300,
            title:
                "By registering you accept the *Privacy Policy* and *Terms of Use*"),
        Gap(context.SmallSpacer),
      ],
    );
  }
}
