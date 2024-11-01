import 'package:flutter/material.dart';

extension EdgeInsetsSymmetricExtension on BuildContext {
  EdgeInsets get SmallHorizontalEdgeInsets =>
      const EdgeInsets.symmetric(horizontal: 5);

  EdgeInsets get MidHorizontalEdgeInsets =>
      const EdgeInsets.symmetric(horizontal: 10);

  EdgeInsets get LargeHorizontalEdgeInsets =>
      const EdgeInsets.symmetric(horizontal: 20);

  EdgeInsets get SmallVerticalEdgeInsets =>
      const EdgeInsets.symmetric(vertical: 5);

  EdgeInsets get MidVerticalEdgeInsets =>
      const EdgeInsets.symmetric(vertical: 10);

  EdgeInsets get LargeVerticalEdgeInsets =>
      const EdgeInsets.symmetric(vertical: 20);
}

extension EdgeInsetsAllExtension on BuildContext {
  EdgeInsets get SmallAllEdgeInsets => const EdgeInsets.all(5);

  EdgeInsets get MidAllEdgeInsets => const EdgeInsets.all(10);

  EdgeInsets get LargeAllEdgeInsets => const EdgeInsets.all(20);
}

extension EdgeInsetsOnlyExtension on BuildContext {
  /* Left */
  EdgeInsets get SmallOnlyLeftEdgeInsets => const EdgeInsets.only(left: 5);
  EdgeInsets get MidOnlyLeftEdgeInsets => const EdgeInsets.only(left: 10);
  EdgeInsets get LargeOnlyLeftEdgeInsets => const EdgeInsets.only(left: 20);

  /* Right */
  EdgeInsets get SmallOnlyRightEdgeInsets => const EdgeInsets.only(right: 5);
  EdgeInsets get MidOnlyRightEdgeInsets => const EdgeInsets.only(right: 10);
  EdgeInsets get LargeOnlyRightEdgeInsets => const EdgeInsets.only(right: 20);

  /* Bottom */
  EdgeInsets get SmallOnlyBottomEdgeInsets => const EdgeInsets.only(bottom: 5);
  EdgeInsets get MidOnlyBottomEdgeInsets => const EdgeInsets.only(bottom: 10);
  EdgeInsets get LargeOnlyBottomEdgeInsets => const EdgeInsets.only(bottom: 20);

  /* Top */
  EdgeInsets get SmallOnlyTopEdgeInsets => const EdgeInsets.only(top: 5);
  EdgeInsets get MidOnlyTopEdgeInsets => const EdgeInsets.only(top: 10);
  EdgeInsets get LargeOnlyTopEdgeInsets => const EdgeInsets.only(top: 20);
}
