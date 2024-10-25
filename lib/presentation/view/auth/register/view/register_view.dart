import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:rapid_chain/config/base/view/base_view.dart';
import 'package:rapid_chain/presentation/view/auth/register/view_model/register_view_model.dart';
import 'package:rapid_chain/presentation/view/auth/register/widget/email_verification_widget.dart';
import 'package:rapid_chain/presentation/view/auth/register/widget/first_attemp_widget.dart';
import 'package:rapid_chain/presentation/view/auth/register/widget/last_attemp_widget.dart';
import 'package:rapid_chain/presentation/widget/button/button_global_widget.dart';
import 'package:rapid_chain/presentation/widget/card/card_global_widget.dart';
import 'package:rapid_chain/presentation/widget/label/label_global_md_widget.dart';
import 'package:rapid_chain/util/constant/general_enum.dart';
import 'package:rapid_chain/util/constant/navigation_constant.dart';
import 'package:rapid_chain/util/extension/design_extension/edge_insets_extension.dart';
import 'package:rapid_chain/util/extension/design_extension/spacer_extension.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});
  @override
  Widget build(BuildContext context) {
    return BaseView<RegisterViewModel>(
      viewModel: RegisterViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, RegisterViewModel value) =>
          Scaffold(
        body: SafeArea(
          child: Padding(
            padding: context.MidHorizontalEdgeInsets,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Gap(context.LargeSpacer),
                CardGlobalWidget(
                  color: APPLICATION_COLOR.PRIMARY,
                  child: Padding(
                    padding: context.MidAllEdgeInsets,
                    child: Column(
                      children: [
                        Observer(builder: (context) {
                          if (value.attempIndex == 0) {
                            return const FirstAttempWidget();
                          } else if (value.attempIndex == 1) {
                            return const EmailVerificationWidget();
                          } else {
                            return const LastAttempWidget();
                          }
                        }),
                        Gap(context.MidSpacer),
                        Observer(builder: (context) {
                          return ButtonGlobalWidget(
                            onTap: () =>
                                value.changeAttemp(value.attempIndex + 1),
                            text: value.attempIndex > 1 ? "Register" : "Next",
                          );
                        }),
                        Gap(context.SmallSpacer)
                      ],
                    ),
                  ),
                ),
                Gap(context.SmallSpacer),
                GestureDetector(
                    onTap: () =>
                        context.pushReplacementNamed(NavigationConstant.LOGIN),
                    child: const LabelGlobalMdWidget(
                        fontWeight: FontWeight.w300,
                        fontSize: FONT_SIZE.BODY_MEDIUM,
                        title: "Have an account? *Login*")),
                Gap(context.MidSpacer),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
