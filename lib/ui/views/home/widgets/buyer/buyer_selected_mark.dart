import 'package:flutter/material.dart';
import 'package:kreyno/app/app.bottomsheets.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_icons.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/views/home/widgets/common/car_top_bar.dart';
import 'package:kreyno/ui/views/home/widgets/seller/let_my_place_bottombar.dart';
import 'package:kreyno/ui/widgets/dumb/custom_icon.dart';
import 'package:kreyno/ui/widgets/dumb/custom_text.dart';
import 'package:kreyno/ui/widgets/dumb/gap.dart';
import 'package:stacked_services/stacked_services.dart';

class BuyerSelectedMark extends StatelessWidget {
  const BuyerSelectedMark({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const CarTopBar(),
        InkWell(
          onTap: () {
            final result = locator<BottomSheetService>()
                .showCustomSheet(variant: BottomSheetType.payForSpot);
          },
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: AppSpacing.px24),
                padding: EdgeInsets.all(AppSpacing.px8 * 2),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network("https://picsum.photos/200/300",
                              width: AppSpacing.px1 * 40,
                              height: AppSpacing.px1 * 40,
                              fit: BoxFit.cover),
                        ),
                        HGap(AppSpacing.px8),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText.smallParagraphMedium("sarah.dupons92"),
                            CustomText.labelMedium(
                              "propose une place à",
                              color: AppColors.textKre,
                            )
                          ],
                        ),
                        const Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
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
                          ),
                        )
                      ],
                    ),
                    VGap(AppSpacing.px8),
                    const CustomText.paragraph(
                      "Rue de la paix 8ème arrondissement, Paris, France",
                      maxLines: 2,
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
                  ],
                ),
              ),
              VGap(AppSpacing.px8 * 2),
              const LetMyPlaceBottombar(),
            ],
          ),
        )
      ],
    );
  }
}
