import 'package:flutter/material.dart';

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
    return Image.network(
      source,
      fit: fit,
      alignment: alignment,
    );
  }
}
