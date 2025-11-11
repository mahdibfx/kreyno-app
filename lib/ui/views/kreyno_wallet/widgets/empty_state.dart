import 'package:flutter/material.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_images.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/common/app_strings.dart';
import 'package:kreyno/ui/widgets/dumb/custom_text.dart';
import 'package:kreyno/ui/widgets/dumb/gap.dart';

class EmptyHistoryState extends StatelessWidget {
  const EmptyHistoryState({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          AppImages.walletEmptyStateIllustration,
          height: 64 * AppSpacing.px1,
          width: 73 * AppSpacing.px1,
        ),
        VGap(AppSpacing.px24),
        CustomText.largeTitle(
          WalletStrings.noEarningsYet,
          maxLines: 2,
          textAlign: TextAlign.center,
        ),
        VGap(AppSpacing.px4),
        CustomText.smallParagraphMedium(
          WalletStrings.earningsWillAppearHere,
          maxLines: 10,
          textAlign: TextAlign.center,
          color: AppColors.textKre,
        ),
      ],
    );
  }
}
