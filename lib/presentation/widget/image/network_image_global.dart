import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NetworkImageGlobal extends StatelessWidget {
  final String source;
  final BoxFit fit;
  final Alignment alignment;

  const NetworkImageGlobal(
      {required this.source,
      super.key,
      this.alignment = Alignment.center,
      this.fit = BoxFit.cover});

  @override
  Widget build(BuildContext context) {
    if (source.endsWith(".svg")) {
      return SvgPicture.network(source, fit: fit, alignment: alignment);
    }
    return Image.network(
      source,
      fit: fit,
      alignment: alignment,
    );
  }
}
