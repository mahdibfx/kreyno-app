import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kreyno/ui/views/my_let_place/widgets/smart/my_marker_details.dart';
import 'package:kreyno/ui/widgets/dumb/lifecycle_manager.dart';
import 'package:stacked/stacked.dart';

import 'my_let_place_viewmodel.dart';

class MyLetPlaceView extends StackedView<MyLetPlaceViewModel> {
  const MyLetPlaceView({Key? key}) : super(key: key);
  @override
  // TODO: implement reactive
  bool get reactive => true;
  @override
  Widget builder(
    BuildContext context,
    MyLetPlaceViewModel viewModel,
    Widget? child,
  ) {
    return LifeCycleManager(
      didChangeAppLifecycleState: (state) {
        if (state == AppLifecycleState.resumed) {
          viewModel.rebuildUi();
        }
      },
      child: PopScope(
        canPop: false,

        child: ViewModelBuilder.reactive(
          viewModelBuilder: () => viewModel,
          builder: (context, viewModel, child) => Scaffold(
            body: Stack(
              children: [
                GoogleMap(
                  markers: {
                    Marker(
                      markerId: MarkerId("${viewModel.parkingSpot!.id}"),

                      icon: AssetMapBitmap("assets/images/Map_pin.png"),
                      position: LatLng(
                        viewModel.parkingSpot!.latitude,
                        viewModel.parkingSpot!.longitude,
                      ),
                    ),
                  },
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
          ),
        ),
      ),
    );
  }

  @override
  void onDispose(MyLetPlaceViewModel viewModel) {
    // TODO: implement onDispose
    viewModel.disposeSocketService();

    super.onDispose(viewModel);
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
