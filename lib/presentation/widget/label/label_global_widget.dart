import 'package:flutter/material.dart';
import 'package:rapid_chain/util/constant/general_enum.dart';
import 'package:rapid_chain/util/extension/theme_extension.dart';

class LabelGlobalWidget extends StatelessWidget {
  final String title;
  final double? textLineHeight;
  final TextOverflow overflow;
  final FONT_SIZE fontSize;
  final APPLICATION_COLOR textColor;
  final TextAlign align;
  final int? maxLines;
  final double? letterSpace;
  final FontWeight? fontWeight;
  const LabelGlobalWidget({
    required this.title,
    this.fontSize = FONT_SIZE.BODY_LARGE,
    this.textColor = APPLICATION_COLOR.TITLE,
    this.overflow = TextOverflow.visible,
    this.align = TextAlign.left,
    this.textLineHeight = 1.5,
    this.fontWeight,
    this.letterSpace,
    this.maxLines,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      maxLines: maxLines,
      textAlign: align,
      style: context.toTextStyle(fontSize).copyWith(
            color: context.toColor(textColor),
            fontWeight: fontWeight,
            height: textLineHeight,
            letterSpacing: letterSpace,
          ),
    );
  }
}
