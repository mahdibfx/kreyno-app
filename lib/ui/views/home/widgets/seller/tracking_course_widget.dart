import 'package:flutter/material.dart';
import 'package:kreyno/app/app.bottomsheets.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_icons.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/views/home/home_viewmodel.dart';
import 'package:kreyno/ui/views/home/widgets/seller/let_my_place_bottombar.dart';
import 'package:kreyno/ui/widgets/dumb/custom_button.dart';
import 'package:kreyno/ui/widgets/dumb/custom_divider.dart';
import 'package:kreyno/ui/widgets/dumb/custom_icon.dart';
import 'package:kreyno/ui/widgets/dumb/custom_text.dart';
import 'package:kreyno/ui/widgets/dumb/gap.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class TrackingCourseWidget extends ViewModelWidget<HomeViewModel> {
  const TrackingCourseWidget({super.key});

  @override
  Widget build(BuildContext context, viewModel) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CounterAppBar(),
            if (viewModel.clientArrived) const YourClientArrived(),
          ],
        ),
        const BottomActionBar(),
      ],
    );
  }
}

class CounterAppBar extends StatelessWidget {
  const CounterAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: AppSpacing.px24).copyWith(
        top: MediaQuery.of(context).viewPadding.top,
        bottom: AppSpacing.px1 * 14,
      ),
      color: Colors.white,
      width: double.infinity,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              "https://picsum.photos/50/50",
              width: AppSpacing.px1 * 40,
              height: AppSpacing.px1 * 40,
            ),
          ),
          HGap(AppSpacing.px8),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText.smallParagraphBold("sarah.dupons92"),
              CustomText.smallParagraphMedium(
                "Renault Clio 5 · DE-123-JW",
                color: AppColors.textKre,
              ),
            ],
          ),
          const Expanded(child: SizedBox()),
          const CustomText.smallParagraphBold("04:58"),
        ],
      ),
    );
  }
}

class BottomActionBar extends ViewModelWidget<HomeViewModel> {
  const BottomActionBar({super.key});

  @override
  Widget build(BuildContext context, viewModel) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.px20,
        vertical: AppSpacing.px20,
      ),
      child: Column(
        children: [
          if (!viewModel.clientArrived)
            Column(
              children: [
                Row(
                  children: [
                    const CustomIcon(
                      iconPath: AppIcons.info,
                      color: AppColors.textKre,
                    ),
                    HGap(AppSpacing.px4),
                    const CustomText.labelMedium(
                      "Vous pouvez annuler la réservation après 5 minutes.",
                      color: AppColors.textKre,
                    ),
                  ],
                ),
                VGap(AppSpacing.px12),
              ],
            ),
          if (viewModel.clientArrived)
            Column(
              children: [
                const CustomText.title(
                  "58-64 Rue de l'Université, 75007 Paris, France",
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
                        ),
                      ],
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
              Expanded(
                child: CustomButton.filled(
                  text: "Annuler",
                  backgroundColor: AppColors.redKre,
                  foregroundColor: AppColors.white,
                  onPressed: viewModel.clientArrived
                      ? null
                      : () {
                          locator<BottomSheetService>().showCustomSheet(
                            variant: BottomSheetType.cancelationReasons,
                            isScrollControlled: true,
                          );
                        },
                ),
              ),
              SizedBox(width: AppSpacing.px8),
              Expanded(
                child: CustomButton.filled(text: "Message", onPressed: () {}),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class YourClientArrived extends StatelessWidget {
  const YourClientArrived({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: AppSpacing.px24,
        vertical: AppSpacing.px12,
      ),
      padding: EdgeInsets.all(AppSpacing.px16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomText.title("Votre client(e) est arrivé(e)"),
          VGap(AppSpacing.px4),
          const CustomText.smallParagraphMedium(
            "Cédez-lui votre place dès maintenant pour finaliser la réservation.",
            maxLines: 2,
            color: AppColors.textKre,
          ),
          VGap(AppSpacing.px1 * 18),
          CustomButton.filled(text: "J’ai cédé ma place", onPressed: () {}),
        ],
      ),
    );
  }
}
