import 'package:flutter/material.dart';

extension RadiusAllExtension on BuildContext {
  BorderRadius get SmallAllRadius => const BorderRadius.all(Radius.circular(5));
  BorderRadius get MidAllRadius => const BorderRadius.all(Radius.circular(10));
  BorderRadius get LargeAllRadius =>
      const BorderRadius.all(Radius.circular(20));
}
