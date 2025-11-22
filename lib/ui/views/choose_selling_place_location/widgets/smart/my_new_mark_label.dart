import 'package:flutter/material.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/place_type.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_icons.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/views/choose_selling_place_location/choose_selling_place_location_viewmodel.dart';
import 'package:kreyno/ui/widgets/dumb/custom_button.dart';
import 'package:kreyno/ui/widgets/dumb/custom_text.dart';
import 'package:kreyno/ui/widgets/dumb/gap.dart';
import 'package:kreyno/ui/widgets/dumb/rounded_button.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class MyNewMarkLabel
    extends ViewModelWidget<ChooseSellingPlaceLocationViewModel> {
  const MyNewMarkLabel({super.key});

  @override
  Widget build(BuildContext context, viewModel) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                RoundedButton(
                  iconPath: AppIcons.arrowLeft,
                  onPressed: () {
                    locator<NavigationService>().back();
                  },
                  shape: BoxShape.rectangle,
                ),
                HGap(AppSpacing.px8),
                Expanded(
                  child: GooglePlaceAutoCompleteTextField(
                    placeType: PlaceType.address,
                    countries: const ["fr"],
                    itemClick: (positionPrediction) {
                      viewModel.onItemClicked(positionPrediction.description!);
                    },

                    boxDecoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    inputDecoration: InputDecoration(
                      filled: true,
                      fillColor: AppColors.white,
                      isDense: true,

                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    textEditingController: TextEditingController(),
                    googleAPIKey: "AIzaSyAhoFVZiHJ05kCvSW6tqV3rwQX4YrgGsxA",
                  ),
                ),
              ],
            ),
          ),
        ),
        const ChoosePlaceBottomBar(),
      ],
    );
  }
}

class ChoosePlaceBottomBar
    extends ViewModelWidget<ChooseSellingPlaceLocationViewModel> {
  const ChoosePlaceBottomBar({super.key});

  @override
  Widget build(BuildContext context, viewModel) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsetsDirectional.only(end: AppSpacing.px24),
          child: Align(
            alignment: Alignment.centerRight,
            child: RoundedButton(
              shape: BoxShape.rectangle,
              iconPath: AppIcons.gpsOn,
              onPressed: () {
                viewModel.useMyPosition();
              },
            ),
          ),
        ),
        VGap(AppSpacing.px24),
        Container(
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
              const CustomText(
                text: "Choisissez un emplacement",
                style: CustomTextStyle.title,
              ),
              VGap(AppSpacing.px4),
              CustomText(
                text: viewModel.address,
                style: CustomTextStyle.smallParagraphMedium,
                color: AppColors.textKre,
              ),
              VGap(AppSpacing.px24),
              CustomButton.filled(
                isDisabled: viewModel.isBusy,
                text: "Choisir",
                onPressed: () async {
                  viewModel.chooseClicked();
                },
              ),
              VGap(AppSpacing.px8),
            ],
          ),
        ),
      ],
    );
  }
}
