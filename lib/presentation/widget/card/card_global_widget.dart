import 'package:flutter/material.dart';
import 'package:rapid_chain/util/constant/general_enum.dart';
import 'package:rapid_chain/util/extension/design_extension/radius_extension.dart';
import 'package:rapid_chain/util/extension/theme_extension.dart';

class CardGlobalWidget extends StatelessWidget {
  final APPLICATION_COLOR color;
  final VoidCallback? onTap;
  final double opacity;
  final Widget child;
  const CardGlobalWidget(
      {required this.child,
      this.onTap,
      this.opacity = 1,
      this.color = APPLICATION_COLOR.LIGHT,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              color: context.toColor(color).withOpacity(opacity),
              borderRadius: context.LargeAllRadius),
          child: ClipRRect(borderRadius: context.LargeAllRadius, child: child),
        ),
        onTap != null
            ? Positioned.fill(
                child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: context.LargeAllRadius,
                  onTap: () => onTap != null ? onTap!() : null,
                ),
              ))
            : const SizedBox.shrink()
      ],
    );
  }
}
