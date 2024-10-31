import 'package:flutter/material.dart';
import 'package:rapid_chain/domain/entity/leader_board/reference_leader_board_entity.dart';
import 'package:rapid_chain/presentation/widget/card/card_global_widget.dart';
import 'package:rapid_chain/presentation/widget/image/network_image_global.dart';
import 'package:rapid_chain/presentation/widget/label/label_global_widget.dart';
import 'package:rapid_chain/util/extension/design_extension/edge_insets_extension.dart';

class ReferenceLeaderBoardListRowWidget extends StatelessWidget {
  final ReferenceLeaderBoardUserEntity entity;
  const ReferenceLeaderBoardListRowWidget({required this.entity, super.key});

  @override
  Widget build(BuildContext context) {
    return CardGlobalWidget(
      child: Padding(
        padding: context.LargeAllEdgeInsets,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(23)),
              child: SizedBox(
                height: 45,
                width: 45,
                child: NetworkImageGlobal(source: entity.profilePicture.url),
              ),
            ),
            LabelGlobalWidget(title: entity.name),
            LabelGlobalWidget(title: entity.reference.toString()),
          ],
        ),
      ),
    );
  }
}
