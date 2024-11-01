import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:rapid_chain/domain/entity/flow/comment_entity.dart';
import 'package:rapid_chain/presentation/widget/label/label_global_widget.dart';
import 'package:rapid_chain/util/constant/general_enum.dart';
import 'package:rapid_chain/util/extension/design_extension/edge_insets_extension.dart';
import 'package:rapid_chain/util/extension/design_extension/spacer_extension.dart';

class FlowCommentPreviewWidget extends StatelessWidget {
  final List<CommentEntity> commentEntity;
  const FlowCommentPreviewWidget({required this.commentEntity, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            LabelGlobalWidget(
              title: commentEntity
                  .firstWhere((e) => e.parentId == -1)
                  .user
                  .userName,
              fontWeight: FontWeight.w700,
              fontSize: FONT_SIZE.BODY_MEDIUM,
            ),
            Gap(context.SmallSpacer),
            LabelGlobalWidget(
              title: commentEntity.firstWhere((e) => e.parentId == -1).content,
              fontSize: FONT_SIZE.BODY_MEDIUM,
            ),
          ],
        ),
        Gap(context.SmallSpacer),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: context.MidHorizontalEdgeInsets,
          itemCount: commentEntity.where((e) => e.parentId != -1).length,
          itemBuilder: (context, index) {
            var newList = commentEntity.where((e) => e.parentId != -1).toList();
            return Row(
              children: [
                LabelGlobalWidget(
                  title: newList[index].user.userName,
                  fontWeight: FontWeight.w700,
                  fontSize: FONT_SIZE.BODY_MEDIUM,
                ),
                Gap(context.SmallSpacer),
                LabelGlobalWidget(
                  title: newList[index].content,
                  fontSize: FONT_SIZE.BODY_MEDIUM,
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
