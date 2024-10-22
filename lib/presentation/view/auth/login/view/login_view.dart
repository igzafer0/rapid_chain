import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:rapid_chain/config/base/view/base_view.dart';
import 'package:rapid_chain/presentation/view/auth/login/view_model/login_view_model.dart';
import 'package:rapid_chain/presentation/widget/card/card_global_widget.dart';
import 'package:rapid_chain/presentation/widget/label/label_global_md_widget.dart';
import 'package:rapid_chain/presentation/widget/label/label_global_widget.dart';
import 'package:rapid_chain/presentation/widget/text_field/text_field_global_widget.dart';
import 'package:rapid_chain/presentation/widget/button/button_global_widget.dart';
import 'package:rapid_chain/util/constant/general_enum.dart';
import 'package:rapid_chain/util/constant/navigation_constant.dart';
import 'package:rapid_chain/util/enum/input_type.dart';
import 'package:rapid_chain/util/extension/design_extension/edge_insets_extension.dart';
import 'package:rapid_chain/util/extension/design_extension/spacer_extension.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
      viewModel: LoginViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, LoginViewModel value) => Scaffold(
        body: SafeArea(
          child: Padding(
            padding: context.MidHorizontalEdgeInsets,
            child: ListView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              children: [
                Gap(context.LargeSpacer),
                Gap(context.LargeSpacer),
                SizedBox(
                    height: 200, child: Image.asset("assets/img/bitcoin.png")),
                Gap(context.LargeSpacer),
                CardGlobalWidget(
                  color: APPLICATION_COLOR.PRIMARY,
                  child: Padding(
                      padding: context.MidAllEdgeInsets,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Gap(context.LargeSpacer),
                          const LabelGlobalWidget(title: "E-mail"),
                          Gap(context.MidSpacer),
                          TextFieldGlobalWidget(
                            newText: (e) => {},
                            inputType: InputType.MAIL,
                          ),
                          Gap(context.LargeSpacer),
                          const LabelGlobalWidget(title: "Password"),
                          Gap(context.MidSpacer),
                          TextFieldGlobalWidget(
                              inputType: InputType.PASSWORD,
                              newText: (e) => {}),
                          Gap(context.LargeSpacer),
                          ButtonGlobalWidget(
                            onTap: () => context
                                .pushReplacementNamed(NavigationConstant.HOME),
                            text: "Log In",
                          ),
                          Gap(context.MidSpacer),
                          const Row(
                            children: [
                              Spacer(),
                              LabelGlobalMdWidget(
                                  title: "Forgot your password? *Reset*"),
                            ],
                          ),
                          Gap(context.LargeSpacer),
                        ],
                      )),
                ),
                Gap(context.LargeSpacer),
                GestureDetector(
                  onTap: () =>
                      context.pushReplacementNamed(NavigationConstant.REGISTER),
                  child: const LabelGlobalMdWidget(
                      title: "Don't have an account? *Register*"),
                ),
                Gap(context.MidSpacer),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
