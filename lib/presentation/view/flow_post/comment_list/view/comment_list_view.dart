import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:rapid_chain/config/base/view/base_view.dart';
import 'package:rapid_chain/presentation/view/flow_post/comment_list/view_model/comment_list_view_model.dart';
import 'package:rapid_chain/presentation/view/widget/flow_post_comment_widget/flow_post_comment_widget.dart';
import 'package:rapid_chain/presentation/widget/text_field/text_field_global_widget.dart';
import 'package:rapid_chain/util/constant/general_enum.dart';
import 'package:rapid_chain/util/extension/design_extension/edge_insets_extension.dart';
import 'package:rapid_chain/util/extension/design_extension/size_extension.dart';
import 'package:rapid_chain/util/extension/design_extension/spacer_extension.dart';
import 'package:rapid_chain/util/extension/theme_extension.dart';

class CommentListView extends StatelessWidget {
  final int PostId;
  const CommentListView({required this.PostId, super.key});
  @override
  Widget build(BuildContext context) {
    return BaseView<CommentListViewModel>(
      viewModel: CommentListViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, CommentListViewModel value) =>
          Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  padding: context.MidHorizontalEdgeInsets,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                        margin: context.MidOnlyBottomEdgeInsets,
                        child: const FlowPostCommentWidget());
                  },
                ),
              ),
              Container(
                height: 80,
                padding: context.MidAllEdgeInsets,
                width: context.ScreenWidth,
                color: context.toColor(APPLICATION_COLOR.BACKGROUND),
                alignment: Alignment.topCenter,
                child: Row(
                  children: [
                    Expanded(
                      child: TextFieldGlobalWidget(
                        newText: (e) => {},
                        background: APPLICATION_COLOR.PRIMARY,
                      ),
                    ),
                    Gap(context.MidSpacer),
                    const Icon(Icons.send)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
