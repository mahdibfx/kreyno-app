import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kreyno/ui/views/my_let_place/widgets/smart/my_marker_details.dart';
import 'package:stacked/stacked.dart';

import 'my_let_place_viewmodel.dart';

class MyLetPlaceView extends StackedView<MyLetPlaceViewModel> {
  const MyLetPlaceView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    MyLetPlaceViewModel viewModel,
    Widget? child,
  ) {
    // print(viewModel.reservation!.status.toString());
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              zoom: 17,
              target: LatLng(
                viewModel.parkingSpot!.latitude,
                viewModel.parkingSpot!.longitude,
              ),
            ),
          ),
          const MyMarkerDetails(),
        ],
      ),
    );
  }

  @override
  void onViewModelReady(MyLetPlaceViewModel viewModel) {
    // TODO: implement onViewModelReady
    viewModel.initialise();
    super.onViewModelReady(viewModel);
  }

  @override
  MyLetPlaceViewModel viewModelBuilder(BuildContext context) =>
      MyLetPlaceViewModel();
}
