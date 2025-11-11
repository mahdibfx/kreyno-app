import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kreyno/models/card.dart' as cardModel;
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_icons.dart';
import 'package:kreyno/ui/common/app_images.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/common/app_strings.dart';
import 'package:kreyno/ui/widgets/dumb/custom_icon.dart';
import 'package:kreyno/ui/widgets/dumb/custom_text.dart';

class CreditCard extends StatelessWidget {
  final cardModel.Card card;
  final VoidCallback? onDelete;
  final VoidCallback? onSetAsDefault;

  const CreditCard({super.key, required this.card})
    : onDelete = null,
      onSetAsDefault = null;

  const CreditCard.withActions({
    super.key,
    required this.card,
    required this.onDelete,
    required this.onSetAsDefault,
  }) : assert(
         onDelete != null && onSetAsDefault != null,
         'onDelete and onSetAsDefault must be provided',
       );

  bool get _hasActions => onDelete != null && onSetAsDefault != null;

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: AppSpacing.px8,
                  children: [
                    if (card.brand.toLowerCase() == "visa")
                      SvgPicture.asset(
                        AppImages.visaLogo,
                        width: 68 * AppSpacing.px1,
                      )
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
                    if (card.isDefault)
                      CustomIcon(
                        iconPath: AppIcons.crownMinimalisticAlt,
                        color: AppColors.greenKre,
                        size: AppSpacing.px16,
                      ),
                  ],
                ),
                if (_hasActions)
                  GestureDetector(
                    onTapDown: (details) async {
                      await showMenu<int>(
                        color: AppColors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppSpacing.px12),
                          side: BorderSide(
                            color: AppColors.strokeKre.withValues(alpha: .25),
                          ),
                        ),
                        context: context,
                        position: RelativeRect.fromRect(
                          details.globalPosition & const Size(40.0, 40.0),
                          Offset(AppSpacing.px24, -AppSpacing.px12) &
                              MediaQuery.of(context).size,
                        ),
                        elevation: .3,
                        items: <PopupMenuEntry<int>>[
                          PopupMenuItem<int>(
                            value: 1,
                            child: IgnorePointer(
                              ignoring: card.isDefault,
                              child: Opacity(
                                opacity: card.isDefault ? .15 : 1.0,
                                child: Row(
                                  spacing: AppSpacing.px8,
                                  children: [
                                    CustomIcon(
                                      iconPath: AppIcons.crownMinimalistic,
                                      size: AppSpacing.px20,
                                    ),
                                    CustomText.smallParagraphMedium(
                                      MyPaymentMethodesStrings.setAsDefault,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          PopupMenuItem<int>(
                            value: 2,
                            child: Row(
                              spacing: AppSpacing.px8,
                              children: [
                                CustomIcon(
                                  iconPath: AppIcons.delete,
                                  size: AppSpacing.px20,
                                ),
                                CustomText.smallParagraphMedium(
                                  MyPaymentMethodesStrings.delete,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ).then((int? result) {
                        if (result != null) {
                          switch (result) {
                            case 1:
                              if (card.isDefault) return;
                              onSetAsDefault!();
                              break;
                            case 2:
                              onDelete!();
                              break;
                          }
                        }
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(AppSpacing.px8),
                      decoration: BoxDecoration(
                        color: AppColors.strokeKre.withValues(alpha: .25),
                        borderRadius: BorderRadius.circular(AppSpacing.px8),
                      ),
                      child: Icon(
                        Icons.more_horiz_outlined,
                        color: AppColors.white,
                        size: AppSpacing.px20,
                      ),
                    ),
                  ),
              ],
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
