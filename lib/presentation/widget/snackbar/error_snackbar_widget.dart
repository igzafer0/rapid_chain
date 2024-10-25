import 'package:flutter/material.dart';

import 'package:rapid_chain/presentation/widget/label/label_global_widget.dart';
import 'package:rapid_chain/util/constant/general_enum.dart';
import 'package:rapid_chain/util/extension/design_extension/edge_insets_extension.dart';
import 'package:rapid_chain/util/extension/design_extension/radius_extension.dart';
import 'package:rapid_chain/util/extension/design_extension/size_extension.dart';
import 'package:rapid_chain/util/extension/theme_extension.dart';

class ErrorSnackBarWidget extends StatelessWidget {
  final String message;
  const ErrorSnackBarWidget({required this.message, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.ScreenWidth,
      padding: context.MidAllEdgeInsets,
      decoration: BoxDecoration(
        color: context.toColor(APPLICATION_COLOR.PRIMARY),
        borderRadius: context.MidAllRadius,
      ),
      child: Row(
        children: [
          Icon(Icons.priority_high,
              color: context.toColor(APPLICATION_COLOR.LIGHT)),
          Expanded(
            child: LabelGlobalWidget(
                title: message,
                fontSize: FONT_SIZE.BODY_MEDIUM,
                textColor: APPLICATION_COLOR.LIGHT),
          ),
        ],
      ),
    );
  }
}
