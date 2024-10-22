import 'package:flutter/material.dart';
import 'package:rapid_chain/util/constant/general_enum.dart';
import 'package:rapid_chain/util/extension/theme_extension.dart';

class LabelGlobalMdWidget extends StatefulWidget {
  final String title;
  final double? textLineHeight;
  final TextOverflow overflow;
  final FONT_SIZE fontSize;
  final APPLICATION_COLOR textColor;
  final TextAlign align;
  final int? maxLines;
  final FontWeight? fontWeight;
  const LabelGlobalMdWidget({
    required this.title,
    this.fontSize = FONT_SIZE.BODY_LARGE,
    this.textColor = APPLICATION_COLOR.TITLE,
    this.overflow = TextOverflow.visible,
    this.align = TextAlign.left,
    this.textLineHeight = 1.5,
    this.fontWeight,
    this.maxLines,
    super.key,
  });

  @override
  State<LabelGlobalMdWidget> createState() => _LabelGlobalMdWidgetState();
}

class _LabelGlobalMdWidgetState extends State<LabelGlobalMdWidget> {
  final boldPattern = RegExp(r'<strong>(.*?)</strong>');

  final spans = <TextSpan>[];
  int currentIndex = 0;

  void addSpan(String text, [TextStyle? style]) {
    if (text.isNotEmpty) {
      spans.add(TextSpan(text: text, style: style));
    }
  }

  String parseMarkdown(String input) {
    var processedLine = input;

    final boldPattern = RegExp(r'\*(.*?)\*');
    processedLine = processedLine.replaceAllMapped(boldPattern, (match) {
      return '<strong>${match.group(1)}</strong>';
    });

    return processedLine;
  }

  @override
  void initState() {
    super.initState();
    var formattedText = parseMarkdown(widget.title);

    final matches = [
      ...boldPattern.allMatches(formattedText),
    ];
    matches.sort((a, b) => a.start.compareTo(b.start));

    for (final match in matches) {
      if (match.start > currentIndex) {
        addSpan(formattedText.substring(currentIndex, match.start));
      }

      if (boldPattern.hasMatch(match.group(0)!)) {
        addSpan(
            match.group(1)!,
            TextStyle(
                fontWeight: FontWeight.w800,
                color: context.toColor(APPLICATION_COLOR.TITLE)));
      }
      currentIndex = match.end;
    }

    if (currentIndex < formattedText.length) {
      addSpan(formattedText.substring(currentIndex));
    }
  }

  @override
  Widget build(BuildContext context) {
    return RichText(
      maxLines: widget.maxLines,
      textAlign: widget.align,
      text: TextSpan(
        children: spans,
        style: context.toTextStyle(widget.fontSize).copyWith(
              color: context.toColor(widget.textColor),
              fontWeight: widget.fontWeight,
              height: widget.textLineHeight,
            ),
      ),
    );
  }
}
