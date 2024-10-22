import 'package:flutter/material.dart';

extension SizeExtension on BuildContext {
  double get SearchBoxHeight => 60;
}

extension ScreenSizeExtension on BuildContext {
  double get ScreenHeight => MediaQuery.of(this).size.height;
  double get ScreenWidth => MediaQuery.of(this).size.width;
}
