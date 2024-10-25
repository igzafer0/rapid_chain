import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:rapid_chain/config/base/view/base_view.dart';
import 'package:rapid_chain/presentation/view/auth/register/view_model/register_view_model.dart';
import 'package:rapid_chain/presentation/view/auth/register/widget/email_verification_widget.dart';
import 'package:rapid_chain/presentation/view/auth/register/widget/first_attemp_widget.dart';
import 'package:rapid_chain/presentation/view/auth/register/widget/name_surname_attemp_widget.dart';
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
          child: Center(
            child: SingleChildScrollView(
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
                              return FirstAttempWidget(
                                initEmail: value.email,
                                initReferanceCode: value.referenceCode,
                                ReferanceCode: (p0) => value.referenceCode = p0,
                                Email: (p0) => value.email = p0,
                              );
                            } else if (value.attempIndex == 1) {
                              return EmailVerificationWidget(
                                  email: value.email,
                                  verificationCode: (p0) =>
                                      value.verificationCode = p0,
                                  onTap: () => value.backAttemp());
                            } else {
                              return NameSurnameAttempWidget(
                                Nickname: (p0) => value.nickname = p0,
                                Password: (p0) => value.password = p0,
                                Name: (p0) => value.name = p0,
                                Surname: (p0) => value.surname = p0,
                              );
                            }
                          }),
                          Gap(context.MidSpacer),
                          Observer(builder: (context) {
                            return ButtonGlobalWidget(
                              onTap: () => value.nextAttemp(),
                              text: value.attempIndex > 1 ? "Register" : "Next",
                            );
                          }),
                          Gap(context.MidSpacer)
                        ],
                      ),
                    ),
                  ),
                  Gap(context.MidSpacer),
                  GestureDetector(
                      onTap: () => context
                          .pushReplacementNamed(NavigationConstant.LOGIN),
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
      ),
    );
  }
}
