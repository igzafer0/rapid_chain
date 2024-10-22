import 'package:flutter/material.dart';

extension SpacerExtension on BuildContext {
  double get BottomCartInfoSpacer => MediaQuery.of(this).padding.bottom + 50;
  double get LargeSpacer => 20;
  double get MidSpacer => 10;
  double get SmallSpacer => 5;
}
