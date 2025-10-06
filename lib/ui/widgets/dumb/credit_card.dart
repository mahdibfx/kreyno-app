import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kreyno/models/card.dart' as cardModel;
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_images.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/common/app_strings.dart';
import 'package:kreyno/ui/widgets/dumb/custom_text.dart';

class CreditCard extends StatelessWidget {
  final cardModel.Card card;
  const CreditCard({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSpacing.px8),
      height: 180 * AppSpacing.px1,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSpacing.px12),
        border: Border.all(color: AppColors.strokeKre, width: 1.0),
      ),
      child: Container(
        padding: EdgeInsets.all(AppSpacing.px12),
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage(AppImages.bgCard),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(AppSpacing.px8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (card.brand.toLowerCase() == "visa")
              SvgPicture.asset(AppImages.visaLogo, width: 68 * AppSpacing.px1)
            else if (card.brand.toLowerCase() == "mastercard")
              SvgPicture.asset(
                AppImages.mastercardLogo,
                width: 50 * AppSpacing.px1,
                height: 30 * AppSpacing.px1,
              )
            else
              CustomText.paragraph(
                CommonStrings.appName,
                color: AppColors.white.withValues(alpha: .3),
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText.title(
                  "**** **** **** ${card.last4}",
                  color: AppColors.white,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomText.labelRegular(
                      CommonStrings.validTill,
                      color: AppColors.textKre,
                    ),
                    CustomText.labelMedium(
                      "${card.expMonth}/${card.expYear.toString().substring(2)}",
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
