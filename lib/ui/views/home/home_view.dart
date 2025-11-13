import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/views/home/widgets/car_selector/car_selector.dart';
import 'package:kreyno/ui/views/home/widgets/home_bottom_bar.dart';
import 'package:kreyno/ui/views/home/widgets/home_fabs.dart';
import 'package:kreyno/ui/views/home/widgets/location_disabled_banner.dart';
import 'package:kreyno/ui/widgets/dumb/gap.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context, HomeViewModel viewModel, Widget? child) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: viewModel.initialCameraPosition,
            onMapCreated: viewModel.onMapCreated,
            zoomControlsEnabled: false,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CarSelector(
                    selectedCar: viewModel.selectedCar,
                    onSelectedCarChanged: (car) =>
                        viewModel.updateSelectedCar(car),
                  ),
                  if (!viewModel.isLocationServiceEnabled)
                    const LocationDisabledBanner(),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [HomeFabs(), VGap(AppSpacing.px24), HomeBottomBar()],
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void onViewModelReady(HomeViewModel viewModel) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      viewModel.initHome();
    });
    super.onViewModelReady(viewModel);
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();
}
