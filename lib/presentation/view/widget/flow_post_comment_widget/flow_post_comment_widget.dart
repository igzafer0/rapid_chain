import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:rapid_chain/domain/entity/flow/comment_entity.dart';
import 'package:rapid_chain/presentation/widget/card/card_global_widget.dart';
import 'package:rapid_chain/presentation/widget/image/network_image_global.dart';
import 'package:rapid_chain/presentation/widget/label/label_global_widget.dart';
import 'package:rapid_chain/util/constant/general_enum.dart';
import 'package:rapid_chain/util/extension/design_extension/edge_insets_extension.dart';
import 'package:rapid_chain/util/extension/design_extension/spacer_extension.dart';

class FlowPostCommentWidget extends StatelessWidget {
  final Function(int) replyId;
  final List<CommentEntity> commentEntity;

  const FlowPostCommentWidget(
      {required this.replyId, required this.commentEntity, super.key});

  @override
  Widget build(BuildContext context) {
    return CardGlobalWidget(
      child: Padding(
        padding: context.LargeAllEdgeInsets,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(13)),
              child: SizedBox(
                width: 25,
                height: 25,
                child: NetworkImageGlobal(
                    fit: BoxFit.cover,
                    source: commentEntity
                        .firstWhere((e) => e.parentId == -1)
                        .user
                        .profilePicture
                        .url),
              ),
            ),
            Gap(context.MidSpacer),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LabelGlobalWidget(
                    title: commentEntity
                        .firstWhere((e) => e.parentId == -1)
                        .user
                        .userName,
                    fontSize: FONT_SIZE.TITLE_MEDIUM,
                    fontWeight: FontWeight.w800,
                  ),
                  Gap(context.SmallSpacer),
                  LabelGlobalWidget(
                    title: commentEntity
                        .firstWhere((e) => e.parentId == -1)
                        .content,
                    fontSize: FONT_SIZE.TITLE_SMALL,
                  ),
                  Gap(context.SmallSpacer),
                  GestureDetector(
                    onTap: () => replyId(
                        commentEntity.firstWhere((e) => e.parentId == -1).id),
                    child: const LabelGlobalWidget(
                      title: "Reply",
                      fontSize: FONT_SIZE.TITLE_SMALL,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: context.MidHorizontalEdgeInsets,
                      itemCount:
                          commentEntity.where((e) => e.parentId != -1).length,
                      itemBuilder: (context, index) {
                        var newList = commentEntity
                            .where((e) => e.parentId != -1)
                            .toList();

                        return Column(
                          children: [
                            Gap(context.MidSpacer),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(13)),
                                  child: SizedBox(
                                    width: 25,
                                    height: 25,
                                    child: NetworkImageGlobal(
                                        fit: BoxFit.cover,
                                        source: newList[index]
                                            .user
                                            .profilePicture
                                            .url),
                                  ),
                                ),
                                Gap(context.MidSpacer),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      LabelGlobalWidget(
                                        title: newList[index].user.userName,
                                        fontSize: FONT_SIZE.TITLE_MEDIUM,
                                        fontWeight: FontWeight.w800,
                                      ),
                                      Gap(context.SmallSpacer),
                                      LabelGlobalWidget(
                                        title: newList[index].content,
                                        fontSize: FONT_SIZE.TITLE_SMALL,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        );
                      })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
