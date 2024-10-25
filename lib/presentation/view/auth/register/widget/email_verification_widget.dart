import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:rapid_chain/presentation/widget/label/label_global_md_widget.dart';
import 'package:rapid_chain/presentation/widget/text_field/text_field_global_widget.dart';
import 'package:rapid_chain/util/enum/input_type.dart';
import 'package:rapid_chain/util/extension/design_extension/spacer_extension.dart';

class EmailVerificationWidget extends StatelessWidget {
  final String email;
  final VoidCallback onTap;
  final Function(String) verificationCode;

  const EmailVerificationWidget(
      {required this.onTap,
      required this.email,
      required this.verificationCode,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Gap(context.MidSpacer),
        GestureDetector(
          onTap: () => onTap(),
          child: LabelGlobalMdWidget(
              title:
                  "We sent a verification email to *$email*. Is the email address incorrect? *Change email address.*"),
        ),
        Gap(context.LargeSpacer),
        TextFieldGlobalWidget(
          inputType: InputType.TEXT,
          newText: (e) => verificationCode(e),
          hintText: "Verification Code",
        ),
        Gap(context.MidSpacer),
      ],
    );
  }
}
