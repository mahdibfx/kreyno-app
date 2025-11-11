import 'package:flutter/material.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_spacing.dart';

class AppTypography {
  AppTypography._();

  static const String satoshi = 'Satoshi';

  static final TextStyle largeTitle = TextStyle(
    fontFamily: satoshi,
    fontSize: 6 * AppSpacing.px4,
    fontWeight: FontWeight.bold,
    color: AppColors.mainKre,
  );

  static final TextStyle title = TextStyle(
    fontFamily: satoshi,
    fontSize: 5 * AppSpacing.px4,
    fontWeight: FontWeight.bold,
    color: AppColors.mainKre,
  );

  static final TextStyle paragraph = TextStyle(
    fontFamily: satoshi,
    fontSize: 4 * AppSpacing.px4,
    fontWeight: FontWeight.bold,
    color: AppColors.mainKre,
  );

  static final TextStyle smallParagraphMedium = TextStyle(
    fontFamily: satoshi,
    fontSize: 3.5 * AppSpacing.px4,
    fontWeight: FontWeight.w500,
    color: AppColors.mainKre,
  );

  static final TextStyle smallParagraphBold = TextStyle(
    fontFamily: satoshi,
    fontSize: 3.5 * AppSpacing.px4,
    fontWeight: FontWeight.bold,
    color: AppColors.mainKre,
  );

  static final TextStyle labelMedium = TextStyle(
    fontFamily: satoshi,
    fontSize: 3 * AppSpacing.px4,
    fontWeight: FontWeight.w500,
    color: AppColors.mainKre,
  );

  static final TextStyle labelRegular = TextStyle(
    fontFamily: satoshi,
    fontSize: 3 * AppSpacing.px4,
    fontWeight: FontWeight.w400,
    color: AppColors.mainKre,
  );
}
