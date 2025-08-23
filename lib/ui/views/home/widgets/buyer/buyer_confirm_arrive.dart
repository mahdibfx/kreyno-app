import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/app/app.router.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_icons.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/widgets/dumb/bottom_sheet_layout.dart';
import 'package:kreyno/ui/widgets/dumb/custom_button.dart';
import 'package:kreyno/ui/widgets/dumb/custom_divider.dart';
import 'package:kreyno/ui/widgets/dumb/custom_icon.dart';
import 'package:kreyno/ui/widgets/dumb/custom_text.dart';
import 'package:kreyno/ui/widgets/dumb/gap.dart';
import 'package:stacked_services/stacked_services.dart';

class BuyerConfirmArrive extends StatelessWidget {
  const BuyerConfirmArrive({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      SafeArea(
          child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: AppSpacing.px24),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(vertical: AppSpacing.px12),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppColors.white),
                    child: const CustomText.smallParagraphMedium(
                        "Arrivé a destination"),
                  ),
                ),
                HGap(AppSpacing.px8),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.white),
                  padding: EdgeInsets.all(AppSpacing.px8),
                  child: SvgPicture.asset(AppIcons.chatRoundDots),
                ),
              ],
            ),
          ),
          VGap(AppSpacing.px12),
          if (false)
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: AppSpacing.px24),
              padding: EdgeInsets.symmetric(
                  horizontal: AppSpacing.px12, vertical: AppSpacing.px12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomText.largeTitle("Confirmez votre arrivée"),
                  const Row(
                    children: [
                      Expanded(
                        child: CustomText.smallParagraphMedium(
                          "Veuillez confirmer votre arrivée pour que l'hôte de la place puisse vous la céder.",
                          maxLines: 2,
                          color: AppColors.textKre,
                        ),
                      ),
                    ],
                  ),
                  VGap(AppSpacing.px16),
                  CustomButton.filled(
                    text: "Confirmer mon arrivée",
                    onPressed: () {},
                  )
                ],
              ),
            ),
          if (true)
            Container(
                margin: EdgeInsets.symmetric(horizontal: AppSpacing.px24),
                padding: EdgeInsets.symmetric(
                    horizontal: AppSpacing.px12, vertical: AppSpacing.px12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppColors.white),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        locator<NavigationService>()
                            .replaceWithSpotBoughtSuccessView();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: AppColors.greenKre.withValues(alpha: .3)),
                        padding: EdgeInsets.all(AppSpacing.px8),
                        child: SvgPicture.asset(
                          AppIcons.flag,
                          color: AppColors.greenKre,
                        ),
                      ),
                    ),
                    HGap(AppSpacing.px8),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText.smallParagraphBold("Arrivée confirmée"),
                          SizedBox(
                            child: CustomText.smallParagraphMedium(
                              "Votre hôte est informé de votre arrivée et va bientôt libérer la place..",
                              maxLines: 2,
                              color: AppColors.textKre,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ))
        ],
      )),
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
                    )
                  ],
                )
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
                    )
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
                    )),
                HGap(AppSpacing.px8),
                const CustomText.paragraph(
                  "sarah.dupons92",
                )
              ],
            ),
            VGap(AppSpacing.px12),
            Container(
              padding: EdgeInsets.all(AppSpacing.px8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: const Border.fromBorderSide(
                      BorderSide(color: AppColors.strokeKre))),
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
                          )),
                      HGap(AppSpacing.px8),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText.smallParagraphBold("Renault Clio 5"),
                          CustomText.smallParagraphMedium(
                              "DE-123-JW · Blanche"),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            // VGap(AppSpacing.px16),
          ],
        ),
        showDragHandler: true,
      )
    ]);
  }
}
