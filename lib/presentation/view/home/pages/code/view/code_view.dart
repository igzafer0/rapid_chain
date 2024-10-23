import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:rapid_chain/config/base/view/base_view.dart';
import 'package:rapid_chain/presentation/view/home/pages/code/view_model/code_view_model.dart';
import 'package:rapid_chain/presentation/view/home/pages/code/widget/task_list_row_widget.dart';
import 'package:rapid_chain/presentation/widget/button/button_global_widget.dart';
import 'package:rapid_chain/presentation/widget/card/card_global_widget.dart';
import 'package:rapid_chain/presentation/widget/divider/divider_global_widget.dart';
import 'package:rapid_chain/presentation/widget/label/label_global_widget.dart';
import 'package:rapid_chain/presentation/widget/text_field/text_field_global_widget.dart';
import 'package:rapid_chain/util/constant/general_enum.dart';
import 'package:rapid_chain/util/enum/input_type.dart';
import 'package:rapid_chain/util/extension/design_extension/edge_insets_extension.dart';
import 'package:rapid_chain/util/extension/design_extension/spacer_extension.dart';

class CodeView extends StatelessWidget {
  const CodeView({super.key});
  @override
  Widget build(BuildContext context) {
    return BaseView<CodeViewModel>(
      viewModel: CodeViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, CodeViewModel value) => Scaffold(
        body: SafeArea(
          bottom: false,
          child: ListView(
            padding: context.MidHorizontalEdgeInsets,
            children: [
              CardGlobalWidget(
                child: Padding(
                  padding: context.LargeAllEdgeInsets,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const LabelGlobalWidget(
                          title:
                              "Lorem ipsum dolor sit amet. Ich bin test. Biqrue melzum saugza."),
                      Gap(context.LargeSpacer),
                      TextFieldGlobalWidget(
                        newText: (e) => {},
                        hintText: "Enter Code",
                        inputType: InputType.MAIL,
                      ),
                      Gap(context.LargeSpacer),
                      ButtonGlobalWidget(
                        onTap: () => {},
                        text: "Claim",
                      )
                    ],
                  ),
                ),
              ),
              Gap(context.LargeSpacer),
              const DividerGlobalWidget(),
              Gap(context.LargeSpacer),
              const LabelGlobalWidget(
                title: "Tasks",
                fontWeight: FontWeight.w800,
                fontSize: FONT_SIZE.HEADLINE_LARGE,
              ),
              const LabelGlobalWidget(
                title: "You can earn points by completing tasks.",
                fontWeight: FontWeight.w400,
                textColor: APPLICATION_COLOR.SUBTITLE,
                fontSize: FONT_SIZE.BODY_MEDIUM,
              ),
              Gap(context.LargeSpacer),
              ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    margin: context.MidOnlyBottomEdgeInsets,
                    child: TaskListRowWidget(
                      text: "indexo: $index",
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
