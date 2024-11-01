import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:rapid_chain/domain/entity/flow/flow_entity.dart';
import 'package:rapid_chain/presentation/view/widget/flow_post_widget/flow_comment_preview_widget.dart';
import 'package:rapid_chain/presentation/widget/image/network_image_global.dart';
import 'package:rapid_chain/presentation/widget/label/label_global_md_widget.dart';
import 'package:rapid_chain/presentation/widget/label/label_global_widget.dart';
import 'package:rapid_chain/util/constant/general_enum.dart';
import 'package:rapid_chain/util/constant/navigation_constant.dart';
import 'package:rapid_chain/util/extension/design_extension/edge_insets_extension.dart';
import 'package:rapid_chain/util/extension/design_extension/size_extension.dart';
import 'package:rapid_chain/util/extension/design_extension/spacer_extension.dart';
import 'package:rapid_chain/util/extension/string_extension.dart';

class FlowPostWidget extends StatelessWidget {
  final FlowEntity flowEntity;
  const FlowPostWidget({required this.flowEntity, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: context.MidHorizontalEdgeInsets,
          child: Row(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                child: SizedBox(
                  width: 40,
                  height: 40,
                  child: NetworkImageGlobal(
                      fit: BoxFit.cover,
                      source: flowEntity.user.profilePicture.url),
                ),
              ),
              Gap(context.MidSpacer),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LabelGlobalWidget(
                    title: flowEntity.user.userName,
                    fontSize: FONT_SIZE.TITLE_MEDIUM,
                    fontWeight: FontWeight.w800,
                  ),
                  LabelGlobalWidget(
                    title: flowEntity.createdDate.formatTimeOnlyDateWithYear,
                    textColor: APPLICATION_COLOR.SUBTITLE,
                    fontSize: FONT_SIZE.BODY_SMALL,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
            ],
          ),
        ),
        Gap(context.MidSpacer),
        SizedBox(
          width: context.ScreenWidth,
          child: AspectRatio(
            aspectRatio: 1,
            child: NetworkImageGlobal(source: flowEntity.mediaItem.url),
          ),
        ),
        Gap(context.MidSpacer),
        Padding(
          padding: context.MidHorizontalEdgeInsets,
          child: Row(
            children: [
              flowEntity.isLiked
                  ? const Icon(Icons.favorite, size: 32)
                  : const Icon(Icons.favorite_border, size: 32),
              Gap(context.LargeSpacer),
              GestureDetector(
                  onTap: () => context.pushNamed(
                        NavigationConstant.COMMENT_LIST,
                        pathParameters: {"postId": "${flowEntity.id}"},
                      ),
                  child: const Icon(Icons.forum, size: 32)),
            ],
          ),
        ),
        Gap(context.MidSpacer),
        Padding(
          padding: context.MidHorizontalEdgeInsets,
          child: LabelGlobalWidget(
            title: "${flowEntity.likeCount} like",
            fontSize: FONT_SIZE.TITLE_SMALL,
            fontWeight: FontWeight.w700,
          ),
        ),
        Padding(
          padding: context.MidHorizontalEdgeInsets,
          child: LabelGlobalMdWidget(
            title: "*${flowEntity.user.userName}* ${flowEntity.content}",
            fontSize: FONT_SIZE.TITLE_SMALL,
          ),
        ),
        Gap(context.SmallSpacer),
        GestureDetector(
          onTap: () => context.pushNamed(
            NavigationConstant.COMMENT_LIST,
            pathParameters: {"postId": "${flowEntity.id}"},
          ),
          child: Padding(
            padding: context.MidHorizontalEdgeInsets,
            child: const LabelGlobalWidget(
              title: "See other comments",
              fontSize: FONT_SIZE.TITLE_SMALL,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Gap(context.SmallSpacer),
        ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: context.MidHorizontalEdgeInsets,
            itemCount:
                flowEntity.comments.where((e) => e.parentId == -1).length,
            itemBuilder: (context, index) {
              var newList =
                  flowEntity.comments.where((e) => e.parentId == -1).toList();
              return FlowCommentPreviewWidget(
                  commentEntity: flowEntity.comments
                      .where((e) =>
                          e.id == newList[index].id ||
                          e.parentId == newList[index].id)
                      .toList());
            }),
      ],
    );
  }
}
