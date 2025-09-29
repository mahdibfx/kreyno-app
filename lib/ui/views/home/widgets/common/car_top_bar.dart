import 'package:flutter/material.dart';
import 'package:kreyno/app/app.bottomsheets.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_icons.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/views/home/home_viewmodel.dart';
import 'package:kreyno/ui/widgets/dumb/custom_icon.dart';
import 'package:kreyno/ui/widgets/dumb/custom_text.dart';
import 'package:kreyno/ui/widgets/dumb/gap.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CarTopBar extends ViewModelWidget<HomeViewModel> {
  const CarTopBar({super.key});

  @override
  Widget build(BuildContext context, viewModel) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            margin: EdgeInsets.symmetric(horizontal: AppSpacing.px24),
            padding: EdgeInsets.all(
              AppSpacing.px4,
            ).copyWith(right: AppSpacing.px1 * 14),
            child: GestureDetector(
              onTap: () {
                viewModel.onCarTopBarClicked();
              },
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      "https://picsum.photos/200/300",
                      width: AppSpacing.px1 * 38,
                      height: AppSpacing.px1 * 38,
                      fit: BoxFit.cover,
                    ),
                  ),
                  HGap(AppSpacing.px8),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText.labelRegular(
                          "Véhicule choisi",
                          color: AppColors.textKre,
                        ),
                        CustomText.smallParagraphMedium("Peugeot 308"),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      // TODO: Implement refresh functionality
                      locator<BottomSheetService>().showCustomSheet(
                        isScrollControlled: true,
                        variant: BottomSheetType.cancelationReasons,
                      );
                    },
                    child: const CustomIcon(iconPath: AppIcons.refresh),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: AppSpacing.px4),
          if (viewModel.dropdownShown)
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: AppSpacing.px1 * 14,
                vertical: AppSpacing.px1 * 14,
              ),
              margin: EdgeInsets.symmetric(horizontal: AppSpacing.px24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  CarChoiceWidget(
                    isSeleced: viewModel.selectedCarId == 0,
                    id: 0,
                  ),
                  SizedBox(height: AppSpacing.px1 * 14),
                  CarChoiceWidget(
                    isSeleced: viewModel.selectedCarId == 1,
                    id: 1,
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class CarChoiceWidget extends ViewModelWidget<HomeViewModel> {
  const CarChoiceWidget({super.key, required this.isSeleced, required this.id});
  final bool isSeleced;
  final int
  id; // delete this when integrating backend , it is only to show the interactivity
  // final CarModel car; /// here  the variable of car model and from here you extract id
  @override
  Widget build(BuildContext context, viewModel) {
    return InkWell(
      onTap: () {
        viewModel.selectCar(id);
      },
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              "https://picsum.photos/200/300",
              width: AppSpacing.px1 * 38,
              height: AppSpacing.px1 * 38,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: AppSpacing.px8),
          const CustomText(
            text: "Mercedes Class G63",
            style: CustomTextStyle.smallParagraphMedium,
          ),
          const Expanded(child: SizedBox()),
          if (isSeleced) const Icon(Icons.done, color: AppColors.greenKre),
        ],
      ),
    );
  }
}
