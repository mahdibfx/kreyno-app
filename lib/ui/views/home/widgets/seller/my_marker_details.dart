import 'package:flutter/material.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_icons.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/views/home/home_view.dart';
import 'package:kreyno/ui/views/home/home_viewmodel.dart';
import 'package:kreyno/ui/views/home/widgets/home_bottom_bar.dart';
import 'package:kreyno/ui/widgets/dumb/custom_icon.dart';
import 'package:kreyno/ui/widgets/dumb/custom_text.dart';
import 'package:kreyno/ui/widgets/dumb/gap.dart';
import 'package:stacked/stacked.dart';

class MyMarkerDetails extends ViewModelWidget<HomeViewModel> {
  const MyMarkerDetails({super.key});

  @override
  Widget build(BuildContext context, viewModel) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SafeArea(
          child: Container(
            padding: EdgeInsets.all(AppSpacing.px16),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            margin: EdgeInsets.symmetric(horizontal: AppSpacing.px24),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: 11 * AppSpacing.px4,
                      height: 11 * AppSpacing.px4,
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: NetworkImage("https://picsum.photos/100/100"),
                        ),
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.red,
                      ),
                    ),
                    HGap(AppSpacing.px8),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: "Vous",
                          style: CustomTextStyle.smallParagraphMedium,
                        ),
                        CustomText(
                          text: "proposez une place à",
                          style: CustomTextStyle.labelMedium,
                          color: AppColors.textKre,
                        ),
                      ],
                    ),
                    const Expanded(child: SizedBox()),
                    const Row(
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
                const CustomText(
                  text: "Rue de la paix 8ème arrondissement, Paris, France",
                  style: CustomTextStyle.paragraph,
                  maxLines: 2,
                ),
                VGap(AppSpacing.px8),
                Row(
                  children: [
                    const CustomIcon(
                      iconPath: AppIcons.evCharging,
                      color: AppColors.textKre,
                    ),
                    HGap(AppSpacing.px4),
                    const CustomText(
                      text: "Borne non disponible",
                      style: CustomTextStyle.smallParagraphMedium,
                      color: AppColors.textKre,
                    ),
                    const Expanded(child: SizedBox()),
                    InkWell(
                      onTap: () {
                        viewModel.onMyMarkerDeleteClicked();
                      },
                      child: const CustomIcon(iconPath: AppIcons.delete),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const HomeBottomBar(isButtonDisabled: true),
      ],
    );
  }
}
