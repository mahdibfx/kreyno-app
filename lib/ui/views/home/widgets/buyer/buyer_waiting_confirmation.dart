import 'package:flutter/material.dart';
import 'package:kreyno/app/app.bottomsheets.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_icons.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/views/home/home_viewmodel.dart';
import 'package:kreyno/ui/views/home/widgets/seller/received_order_widget.dart';
import 'package:kreyno/ui/views/home/widgets/seller/tracking_course_widget.dart';
import 'package:kreyno/ui/widgets/dumb/bottom_sheet_layout.dart';
import 'package:kreyno/ui/widgets/dumb/custom_button.dart';
import 'package:kreyno/ui/widgets/dumb/custom_divider.dart';
import 'package:kreyno/ui/widgets/dumb/custom_icon.dart';
import 'package:kreyno/ui/widgets/dumb/custom_text.dart';
import 'package:kreyno/ui/widgets/dumb/gap.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class BuyerWaitingConfirmation extends ViewModelWidget<HomeViewModel> {
  const BuyerWaitingConfirmation({super.key});

  @override
  Widget build(BuildContext context, viewModel) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SafeArea(child: CounterBar()),
        BottomSheetLayout(
          body: Column(
            children: [
              VGap(AppSpacing.px8),
              const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: CustomText(
                      text: "58-64 Rue de l'Université,\n 75007 Paris, France",
                      maxLines: 2,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomText(
                        text: "2",
                        color: AppColors.greenKre,
                        style: CustomTextStyle.title,
                      ),
                      CustomIcon(
                        iconPath: AppIcons.euro,
                        size: 20,
                        color: AppColors.greenKre,
                      ),
                    ],
                  ),
                ],
              ),
              VGap(AppSpacing.px8),
              Row(
                children: [
                  const CustomIcon(
                    iconPath: AppIcons.evCharging,
                    color: AppColors.greenKre,
                  ),
                  HGap(AppSpacing.px4),
                  const CustomText(
                    text: "Borne disponible",
                    style: CustomTextStyle.smallParagraphMedium,
                    color: AppColors.greenKre,
                  ),
                  HGap(AppSpacing.px8),
                  Row(
                    children: [
                      const CustomIcon(
                        iconPath: AppIcons.route,
                        color: AppColors.textKre,
                      ),
                      HGap(AppSpacing.px1 * 5),
                      const CustomText(
                        text: "2.5 km",
                        style: CustomTextStyle.smallParagraphMedium,
                        color: AppColors.textKre,
                      ),
                    ],
                  ),
                ],
              ),
              VGap(AppSpacing.px16),
              const CustomDivider(),
              VGap(AppSpacing.px16),
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      'https://picsum.photos/40/40',
                      width: AppSpacing.px1 * 32,
                      height: AppSpacing.px1 * 32,
                    ),
                  ),
                  HGap(AppSpacing.px8),
                  const CustomText.paragraph("sarah.dupons92"),
                ],
              ),
              VGap(AppSpacing.px12),
              Container(
                padding: EdgeInsets.all(AppSpacing.px8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: const Border.fromBorderSide(
                    BorderSide(color: AppColors.strokeKre),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            'https://picsum.photos/48/48',
                            width: AppSpacing.px1 * 48,
                            height: AppSpacing.px1 * 48,
                          ),
                        ),
                        HGap(AppSpacing.px8),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText.smallParagraphBold("Renault Clio 5"),
                            CustomText.smallParagraphMedium(
                              "DE-123-JW · Blanche",
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              VGap(AppSpacing.px16),
              Row(
                children: [
                  Expanded(
                    child: CustomButton.filled(
                      text: "Annuler",
                      backgroundColor: AppColors.redKre,
                      foregroundColor: AppColors.white,
                      onPressed: () {
                        locator<BottomSheetService>().showCustomSheet(
                          variant: BottomSheetType.cancelationReasons,
                        );
                      },
                    ),
                  ),
                  SizedBox(width: AppSpacing.px8),
                  Expanded(
                    child: CustomButton.filled(
                      text: "Message",
                      onPressed: () async {},
                    ),
                  ),
                ],
              ),
            ],
          ),
          showDragHandler: true,
        ),
      ],
    );
  }
}
