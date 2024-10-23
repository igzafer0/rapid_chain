import 'package:flutter/material.dart';
import 'package:rapid_chain/util/constant/general_enum.dart';
import 'package:rapid_chain/util/extension/design_extension/size_extension.dart';
import 'package:rapid_chain/util/extension/theme_extension.dart';

class DividerGlobalWidget extends StatelessWidget {
  const DividerGlobalWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: .3,
        width: context.ScreenWidth / 2,
        color: context.toColor(APPLICATION_COLOR.SUBTITLE),
      ),
    );
  }
}
