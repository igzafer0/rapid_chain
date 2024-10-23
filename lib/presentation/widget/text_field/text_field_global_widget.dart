import 'package:flutter/material.dart';
import 'package:rapid_chain/util/constant/general_enum.dart';
import 'package:rapid_chain/util/enum/input_type.dart';
import 'package:rapid_chain/util/extension/design_extension/edge_insets_extension.dart';
import 'package:rapid_chain/util/extension/design_extension/radius_extension.dart';
import 'package:rapid_chain/util/extension/theme_extension.dart';

class TextFieldGlobalWidget extends StatefulWidget {
  final String initValue;
  final String hintText;
  final int? maxLength;
  final int? maxLines;
  final InputType inputType;
  final APPLICATION_COLOR background;

  final Function(String) newText;
  const TextFieldGlobalWidget({
    super.key,
    this.initValue = "",
    this.hintText = "",
    this.maxLength,
    this.inputType = InputType.TEXT,
    this.maxLines,
    this.background = APPLICATION_COLOR.BACKGROUND,
    required this.newText,
  });

  @override
  State<TextFieldGlobalWidget> createState() => _TextFieldGlobalWidgetState();
}

class _TextFieldGlobalWidgetState extends State<TextFieldGlobalWidget> {
  final _controller = TextEditingController();

  @override
  void initState() {
    _controller.addListener(() {
      widget.newText(_controller.text);
    });
    _controller.text = widget.initValue;
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: context.MidAllRadius,
      child: Container(
        padding: context.MidHorizontalEdgeInsets,
        decoration: BoxDecoration(color: context.toColor(widget.background)),
        alignment: Alignment.centerLeft,
        height: 55,
        child: textFieldWidget(context, widget.inputType),
      ),
    );
  }

  TextField textFieldWidget(BuildContext context, InputType inputType) {
    return TextField(
      controller: _controller,
      autocorrect: false,
      maxLines: widget.maxLines ?? 1,
      obscureText: inputType == InputType.PASSWORD,
      textAlign: TextAlign.left,
      maxLength: widget.maxLength,
      cursorColor: context.toColor(APPLICATION_COLOR.OPPOSITE),
      style: TextStyle(
        color: context.toColor(APPLICATION_COLOR.OPPOSITE),
      ),
      decoration: InputDecoration(
        border: InputBorder.none,
        hintStyle:
            TextStyle(color: context.toColor(APPLICATION_COLOR.SUBTITLE)),
        hintText: widget.hintText,
      ),
    );
  }
}
