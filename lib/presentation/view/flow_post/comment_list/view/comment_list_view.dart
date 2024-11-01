import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gap/gap.dart';
import 'package:rapid_chain/config/base/view/base_view.dart';
import 'package:rapid_chain/presentation/view/flow_post/comment_list/view_model/comment_list_view_model.dart';
import 'package:rapid_chain/presentation/view/widget/flow_post_comment_widget/flow_post_comment_widget.dart';
import 'package:rapid_chain/presentation/widget/appbar/appbar_global_widget.dart';
import 'package:rapid_chain/presentation/widget/label/label_global_md_widget.dart';
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
        model.flowId = PostId;
        model.init();
      },
      onPageBuilder: (BuildContext context, CommentListViewModel value) =>
          Scaffold(
        appBar: const AppbarGlobalWidget(title: "Comments"),
        body: SafeArea(
          child: Column(
            children: [
              Gap(context.MidSpacer),
              Observer(builder: (context) {
                if (value.flowEntity == null) {
                  return const SizedBox.shrink();
                }
                return Expanded(
                  child: ListView.builder(
                    keyboardDismissBehavior:
                        ScrollViewKeyboardDismissBehavior.onDrag,
                    padding: context.MidHorizontalEdgeInsets,
                    itemCount: value.flowEntity!.comments
                        .where((e) => e.parentId == -1)
                        .length,
                    itemBuilder: (context, index) {
                      var newList = value.flowEntity!.comments
                          .where((e) => e.parentId == -1)
                          .toList();

                      return Container(
                        margin: context.MidOnlyBottomEdgeInsets,
                        child: FlowPostCommentWidget(
                            replyId: (p0) => value.changeParentCommentId(p0),
                            commentEntity: value.flowEntity!.comments
                                .where((e) =>
                                    e.id == newList[index].id ||
                                    e.parentId == newList[index].id)
                                .toList()),
                      );
                    },
                  ),
                );
              }),
              Observer(builder: (context) {
                if (value.parentCommentId != null) {
                  return Container(
                    height: 35,
                    padding: context.MidHorizontalEdgeInsets,
                    child: Row(
                      children: [
                        LabelGlobalMdWidget(
                            fontSize: FONT_SIZE.BODY_MEDIUM,
                            title:
                                "You are replying *${value.flowEntity!.comments.firstWhere((e) => e.id == value.parentCommentId).user.userName}*"),
                        const Spacer(),
                        GestureDetector(
                            onTap: () => value.clearParentCommentId(),
                            child: const Icon(Icons.close))
                      ],
                    ),
                  );
                }
                return const SizedBox.shrink();
              }),
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
                        controller: (p0) => value.controller = p0,
                        newText: (e) => value.comment = e,
                        background: APPLICATION_COLOR.PRIMARY,
                      ),
                    ),
                    Gap(context.MidSpacer),
                    GestureDetector(
                        onTap: () => value.sendComment(),
                        child: const Icon(Icons.send))
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
