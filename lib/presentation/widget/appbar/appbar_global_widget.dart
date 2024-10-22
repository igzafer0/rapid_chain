import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rapid_chain/presentation/widget/label/label_global_widget.dart';
import 'package:rapid_chain/util/constant/general_enum.dart';
import 'package:rapid_chain/util/extension/theme_extension.dart';

class AppbarGlobalWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final bool canPop;
  final bool rightPart;
  final APPLICATION_COLOR background;
  final APPLICATION_COLOR itemColor;
  const AppbarGlobalWidget(
      {this.title = "",
      this.canPop = false,
      this.background = APPLICATION_COLOR.PRIMARY,
      this.itemColor = APPLICATION_COLOR.LIGHT,
      this.rightPart = true,
      super.key});
  @override
  Size get preferredSize => const Size.fromHeight(50);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: context.toColor(background)),
      padding: const EdgeInsets.only(bottom: 5, left: 20, right: 20),
      alignment: Alignment.bottomLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () => context.pop(),
            child: Container(
              height: 50,
              color: context.toColor(background),
              width: 40,
              alignment: Alignment.centerLeft,
              child: Icon(Icons.keyboard_arrow_left,
                  size: 38, color: context.toColor(itemColor)),
            ),
          ),
          LabelGlobalWidget(
            title: title,
            fontSize: FONT_SIZE.TITLE_LARGE,
            fontWeight: FontWeight.w600,
            textColor: APPLICATION_COLOR.LIGHT,
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
