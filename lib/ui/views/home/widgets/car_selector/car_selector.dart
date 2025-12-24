import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/place_type.dart';
import 'package:kreyno/models/user.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_icons.dart';
import 'package:kreyno/ui/common/app_images.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/common/app_strings.dart';
import 'package:kreyno/ui/widgets/dumb/custom_icon.dart';
import 'package:kreyno/ui/widgets/dumb/custom_loading_indicator.dart';
import 'package:kreyno/ui/widgets/dumb/custom_text.dart';
import 'package:kreyno/ui/widgets/dumb/gap.dart';
import 'package:stacked/stacked.dart';

import 'car_selector_model.dart';

class CarSelector extends StackedView<CarSelectorModel> {
  final SelectedCar selectedCar;
  final Function(SelectedCar) onSelectedCarChanged;
  final Function(LatLng) onSelectedLocationChanged;

  const CarSelector({
    super.key,
    required this.selectedCar,
    required this.onSelectedCarChanged,
    required this.onSelectedLocationChanged,
  });

  Column _buildLoadingStateWidget() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 14 * AppSpacing.px1,
      children: [
        for (int i = 0; i < 2; i++) ...[
          Row(
            spacing: AppSpacing.px8,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 38 * AppSpacing.px1,
                height: 38 * AppSpacing.px1,
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.circular(AppSpacing.px8),
                ),
              ),
              Expanded(
                child: Container(
                  width: double.maxFinite,
                  margin: EdgeInsets.only(right: 42 * AppSpacing.px1),
                  height: AppSpacing.px20,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFFF1F1F1), Color(0xFFFAFAFA)],
                    ),
                    borderRadius: BorderRadius.circular(AppSpacing.px4),
                  ),
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }

  Row _buildErrorStateWidget(CarSelectorModel viewModel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          spacing: AppSpacing.px4,
          children: [
            CustomIcon(
              iconPath: AppIcons.alert,
              size: AppSpacing.px20,
              color: AppColors.redKre,
            ),
            CustomText.smallParagraphMedium(
              WalletStrings.unableToLoad,
              color: AppColors.redKre,
            ),
          ],
        ),
        GestureDetector(
          onTap: viewModel.getAllCars,
          child: CustomText.paragraph(
            CommonStrings.retry,
            color: AppColors.mainKre,
            textDecoration: TextDecoration.underline,
            textDecorationColor: AppColors.mainKre,
          ),
        ),
      ],
    );
  }

  Column _buildCarsList(CarSelectorModel viewModel) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 14 * AppSpacing.px1,
      children: [
        for (final car in viewModel.cars)
          GestureDetector(
            onTap: car.isSelected ? null : () => viewModel.selectCar(car.id!),
            child: Container(
              color: Colors.transparent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: AppSpacing.px8,
                children: [
                  Flexible(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      spacing: AppSpacing.px8,
                      children: [
                        Container(
                          width: 38 * AppSpacing.px1,
                          height: 38 * AppSpacing.px1,
                          decoration: BoxDecoration(
                            color: const Color(0xFFF5F5F5),
                            image: DecorationImage(
                              image: car.image != null
                                  ? CachedNetworkImageProvider(car.image!.url)
                                  : const AssetImage(
                                      AppImages.placeholderCarImage,
                                    ),

                              fit: selectedCar.image != null
                                  ? BoxFit.cover
                                  : BoxFit.contain,
                            ),
                            borderRadius: BorderRadius.circular(AppSpacing.px8),
                          ),
                        ),
                        Flexible(
                          child: CustomText.smallParagraphMedium(
                            "${car.brand} ${car.model}",
                            color: AppColors.mainKre,
                            maxLines: 2,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (viewModel.isSettingDefaultCar &&
                      viewModel.tappedCarId == car.id)
                    CustomLoadingIndicator(size: AppSpacing.px20),
                  if (car.isSelected)
                    Icon(
                      Icons.check,
                      size: AppSpacing.px20,
                      color: AppColors.greenKre,
                    ),
                ],
              ),
            ),
          ),
      ],
    );
  }

  @override
  Widget builder(
    BuildContext context,
    CarSelectorModel viewModel,
    Widget? child,
  ) {
    return OverlayPortal(
      controller: viewModel.controller,
      overlayChildBuilder: (context) {
        return Stack(
          children: [
            GestureDetector(
              onTap: viewModel.hideCarListOverlay,
              child: Container(color: Colors.transparent),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: RepaintBoundary(
                child: AnimatedScale(
                  scale: viewModel.isListVisible ? 1.0 : .8,
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.fastLinearToSlowEaseIn,
                  child: AnimatedOpacity(
                    opacity: viewModel.isListVisible ? 1.0 : .0,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.fastLinearToSlowEaseIn,
                    child: Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(
                        top:
                            MediaQuery.of(context).padding.top +
                            65 * AppSpacing.px1,
                        left: AppSpacing.px16,
                        right: AppSpacing.px16,
                      ),
                      padding: EdgeInsets.all(14 * AppSpacing.px1),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(AppSpacing.px12),
                        border: Border.all(
                          color: AppColors.strokeKre.withValues(alpha: .25),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(
                              0xFF0C0C0D,
                            ).withValues(alpha: .05),
                            blurRadius: AppSpacing.px4,
                            spreadRadius: -AppSpacing.px4,
                            offset: Offset(0, -AppSpacing.px4),
                          ),
                          BoxShadow(
                            color: const Color(
                              0xFF0C0C0D,
                            ).withValues(alpha: .1),
                            blurRadius: AppSpacing.px16,
                            spreadRadius: -AppSpacing.px8,
                            offset: Offset(0, AppSpacing.px16),
                          ),
                        ],
                      ),
                      child: viewModel.isBusy
                          ? _buildLoadingStateWidget()
                          : viewModel.hasError
                          ? _buildErrorStateWidget(viewModel)
                          : _buildCarsList(viewModel),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).padding.top + 73 * AppSpacing.px1,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.white.withValues(alpha: .8),
                  AppColors.white.withValues(alpha: .0),
                ],
              ),
            ),
          ),
          SafeArea(
            child: GestureDetector(
              onTap: viewModel.showCarListOverlay,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: const Color(
                                0xFF0C0C0D,
                              ).withValues(alpha: .3),
                              blurRadius: AppSpacing.px16,
                              spreadRadius: -AppSpacing.px8,
                              offset: const Offset(0, 0),
                            ),
                          ],
                        ),
                        height: AppSpacing.px1 * 40,

                        child: GooglePlaceAutoCompleteTextField(
                          containerVerticalPadding: 0,
                          textStyle: const TextStyle(fontSize: 14),
                          placeType: PlaceType.address,
                          showError: false,
                          countries: const ["fr", "dz"],
                          itemClick: (positionPrediction) async {
                            // viewModel.onItemClicked(positionPrediction.description!);

                            final position = await GeocodingPlatform.instance!
                                .locationFromAddress(
                                  positionPrediction.description!,
                                );
                            onSelectedLocationChanged(
                              LatLng(
                                position.first.latitude,
                                position.first.longitude,
                              ),
                            );
                          },

                          boxDecoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(14),
                          ),
                          inputDecoration: InputDecoration(
                            prefixIcon: const Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: CustomIcon(
                                iconPath: AppIcons.search,
                                color: AppColors.textKre,
                              ),
                            ),
                            filled: true,

                            hintText: "common.put_arrival_address".tr(),
                            fillColor: AppColors.white,
                            hintStyle: const TextStyle(
                              color: AppColors.textKre,
                              fontSize: 14,
                            ),
                            isDense: true,

                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          textEditingController: TextEditingController(),
                          googleAPIKey:
                              "AIzaSyAhoFVZiHJ05kCvSW6tqV3rwQX4YrgGsxA",
                        ),
                      ),
                    ),
                    HGap(AppSpacing.px8),
                    Container(
                      width: 38 * AppSpacing.px1,
                      height: 38 * AppSpacing.px1,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF5F5F5),
                        image: DecorationImage(
                          fit: selectedCar.image != null
                              ? BoxFit.cover
                              : BoxFit.contain,
                          image: selectedCar.image != null
                              ? CachedNetworkImageProvider(
                                  selectedCar.image!.url,
                                )
                              : const AssetImage(AppImages.placeholderCarImage),
                          // fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(AppSpacing.px8),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  CarSelectorModel viewModelBuilder(BuildContext context) =>
      CarSelectorModel(onSelectedCarChanged: onSelectedCarChanged);
}
