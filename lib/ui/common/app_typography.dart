import 'package:flutter/material.dart';
import 'package:kreyno/ui/common/app_spacing.dart';

class AppTypography {
  AppTypography._();

  static const String _satoshi = 'Satoshi';

  static final TextStyle largeTitle = TextStyle(
    fontFamily: _satoshi,
    fontSize: 6 * AppSpacing.px4,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle title = TextStyle(
    fontFamily: _satoshi,
    fontSize: 5 * AppSpacing.px4,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle paragraph = TextStyle(
    fontFamily: _satoshi,
    fontSize: 4 * AppSpacing.px4,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle smallParagraphMedium = TextStyle(
    fontFamily: _satoshi,
    fontSize: 3.5 * AppSpacing.px4,
    fontWeight: FontWeight.w500,
  );

  static final TextStyle smallParagraphBold = TextStyle(
    fontFamily: _satoshi,
    fontSize: 3.5 * AppSpacing.px4,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle labelMedium = TextStyle(
    fontFamily: _satoshi,
    fontSize: 3 * AppSpacing.px4,
    fontWeight: FontWeight.w500,
  );

  static final TextStyle labelRegular = TextStyle(
    fontFamily: _satoshi,
    fontSize: 3 * AppSpacing.px4,
    fontWeight: FontWeight.w400,
  );
}
