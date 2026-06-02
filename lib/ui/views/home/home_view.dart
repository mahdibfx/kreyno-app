import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/views/home/widgets/buyer/buyer_selected_mark.dart';
import 'package:kreyno/ui/views/home/widgets/car_selector/car_selector.dart';
import 'package:kreyno/ui/views/home/widgets/home_bottom_bar.dart';
import 'package:kreyno/ui/views/home/widgets/home_fabs.dart';
import 'package:kreyno/ui/views/home/widgets/location_disabled_banner.dart';
import 'package:kreyno/ui/widgets/dumb/gap.dart';
import 'package:kreyno/ui/widgets/dumb/loading_overlay.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context, HomeViewModel viewModel, Widget? child) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.white,
      body: LoadingOverlay(
        isShown: viewModel.isBusy,
        child: viewModel.isBusy
            ? const SizedBox()
            : Stack(
                children: [
                  GoogleMap(
                    initialCameraPosition: viewModel.initialCameraPosition,
                    onMapCreated: viewModel.onMapCreated,

                    zoomControlsEnabled: false,
                    myLocationEnabled: true,
                    markers: viewModel.spotsMarkers.toSet(),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CarSelector(
                            onSelectedLocationChanged: (location) {
                              FocusScope.of(context).unfocus();
                              viewModel.updateSelectedLocation(location);
                            },
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
                        children: [
                          const HomeFabs(),
                          VGap(AppSpacing.px24),
                          if (viewModel.selectedSpot != null)
                            BuyerSelectedMark(
                              parkingSpot: viewModel.selectedSpot!,
                            ),
                          VGap(AppSpacing.px24),

                          HomeBottomBar(
                            avatarUrl: viewModel.currentUserAvatarUrl,
                            onLetMyPlaceButtonPressed: () {
                              viewModel.openCreationSpotSheet();
                            },
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

  @override
  void onViewModelReady(HomeViewModel viewModel) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      viewModel.initHome();
    });
    super.onViewModelReady(viewModel);
  }

  @override
  void onDispose(HomeViewModel viewModel) {
    // TODO: implement onDispose

    super.onDispose(viewModel);
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();
}
