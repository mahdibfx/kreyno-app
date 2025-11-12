import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/views/home/widgets/car_selector/car_selector.dart';
import 'package:kreyno/ui/views/home/widgets/home_bottom_bar.dart';
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
          const GoogleMap(
            zoomControlsEnabled: false,
            initialCameraPosition: CameraPosition(target: LatLng(4, 8)),
            markers: {},
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CarSelector(
                selectedCar: viewModel.selectedCar,
                onSelectedCarChanged: (car) => viewModel.updateSelectedCar(car),
              ),
              const HomeBottomBar(),
            ],
          ),
        ],
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();
}
