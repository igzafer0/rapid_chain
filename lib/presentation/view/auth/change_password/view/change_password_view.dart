import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:rapid_chain/config/base/view/base_view.dart';
import 'package:rapid_chain/presentation/view/auth/change_password/view_model/change_password_view_model.dart';
import 'package:rapid_chain/presentation/widget/appbar/appbar_global_widget.dart';
import 'package:rapid_chain/presentation/widget/button/button_global_widget.dart';
import 'package:rapid_chain/presentation/widget/card/card_global_widget.dart';
import 'package:rapid_chain/presentation/widget/label/label_global_widget.dart';
import 'package:rapid_chain/presentation/widget/text_field/text_field_global_widget.dart';
import 'package:rapid_chain/util/enum/input_type.dart';
import 'package:rapid_chain/util/extension/design_extension/edge_insets_extension.dart';
import 'package:rapid_chain/util/extension/design_extension/spacer_extension.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});
  @override
  Widget build(BuildContext context) {
    return BaseView<ChangePasswordViewModel>(
      viewModel: ChangePasswordViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, ChangePasswordViewModel value) =>
          Scaffold(
              appBar: const AppbarGlobalWidget(
                title: "Change Password",
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
                            const LabelGlobalWidget(title: "Old Password"),
                            Gap(context.MidSpacer),
                            TextFieldGlobalWidget(
                              newText: (e) {},
                              inputType: InputType.MAIL,
                            ),
                            Gap(context.LargeSpacer),
                            const LabelGlobalWidget(title: "New Password"),
                            Gap(context.MidSpacer),
                            TextFieldGlobalWidget(
                              newText: (e) {},
                              inputType: InputType.MAIL,
                            ),
                            Gap(context.LargeSpacer),
                            ButtonGlobalWidget(
                              onTap: () => {},
                              text: "Update",
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
