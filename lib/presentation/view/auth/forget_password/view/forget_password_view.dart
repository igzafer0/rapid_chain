import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:rapid_chain/config/base/view/base_view.dart';
import 'package:rapid_chain/presentation/view/auth/forget_password/view_model/forget_password_view_model.dart';
import 'package:rapid_chain/presentation/widget/appbar/appbar_global_widget.dart';
import 'package:rapid_chain/presentation/widget/button/button_global_widget.dart';
import 'package:rapid_chain/presentation/widget/card/card_global_widget.dart';
import 'package:rapid_chain/presentation/widget/label/label_global_widget.dart';
import 'package:rapid_chain/presentation/widget/text_field/text_field_global_widget.dart';
import 'package:rapid_chain/util/constant/general_enum.dart';
import 'package:rapid_chain/util/enum/input_type.dart';
import 'package:rapid_chain/util/extension/design_extension/edge_insets_extension.dart';
import 'package:rapid_chain/util/extension/design_extension/spacer_extension.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});
  @override
  Widget build(BuildContext context) {
    return BaseView<ForgetPasswordViewModel>(
      viewModel: ForgetPasswordViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, ForgetPasswordViewModel value) =>
          Scaffold(
              appBar: const AppbarGlobalWidget(
                title: "Forgot Password",
              ),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: context.LargeHorizontalEdgeInsets,
                    child: CardGlobalWidget(
                      child: Padding(
                        padding: context.LargeAllEdgeInsets,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const LabelGlobalWidget(title: "Mail Address"),
                            Gap(context.MidSpacer),
                            const LabelGlobalWidget(
                              title:
                                  "Enter the email address you use in your account and we will send you an email.",
                              fontSize: FONT_SIZE.BODY_SMALL,
                            ),
                            Gap(context.MidSpacer),
                            TextFieldGlobalWidget(
                              newText: (e) => value.mailAddress = e,
                              inputType: InputType.MAIL,
                              hintText: "E-Mail Address",
                            ),
                            Gap(context.LargeSpacer),
                            ButtonGlobalWidget(
                              onTap: () => value.sendMail(),
                              text: "Send Mail",
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )),
    );
  }
}
