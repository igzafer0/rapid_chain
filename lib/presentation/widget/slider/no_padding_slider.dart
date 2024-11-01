import 'package:flutter/material.dart';
import 'package:rapid_chain/presentation/widget/label/label_global_widget.dart';
import 'package:rapid_chain/util/constant/general_enum.dart';
import 'package:rapid_chain/util/extension/integer_extension.dart';

class NoPaddingSlider extends StatefulWidget {
  final double value;
  final double max;
  final double min;
  final bool darkBackground;
  final void Function(double) changed;
  final VoidCallback changeStart;
  final void Function(double) changeEnd;

  const NoPaddingSlider(
      {this.value = 0,
      this.max = 100,
      this.min = 0,
      this.darkBackground = false,
      required this.changed,
      required this.changeStart,
      required this.changeEnd,
      super.key});

  @override
  State<NoPaddingSlider> createState() => _NoPaddingSliderState();
}

class _NoPaddingSliderState extends State<NoPaddingSlider> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 30,
          child: SliderTheme(
            data: SliderThemeData(
              // here
              trackShape: CustomTrackShape(),
            ),
            child: Slider(
              value: widget.value,
              max: widget.max,
              min: widget.min,
              onChangeEnd: (value) => widget.changeEnd(value),
              onChanged: (value) => widget.changed(value),
              onChangeStart: (value) => widget.changeStart(),
            ),
          ),
        ),
        Row(
          children: [
            LabelGlobalWidget(
              title: widget.value.toInt().formatTime,
              fontSize: FONT_SIZE.BODY_LARGE,
            ),
            const Spacer(),
            LabelGlobalWidget(
              title: widget.max.toInt().formatTime,
              fontSize: FONT_SIZE.BODY_LARGE,
            ),
          ],
        )
      ],
    );
  }
}

class CustomTrackShape extends RoundedRectSliderTrackShape {
  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final trackHeight = sliderTheme.trackHeight! - 3;
    final trackLeft = offset.dx;
    final trackTop = offset.dy + (parentBox.size.height - trackHeight) / 2;
    final trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}
