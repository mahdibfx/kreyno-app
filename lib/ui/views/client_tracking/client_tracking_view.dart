import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kreyno/models/parking_spot.dart';
import 'package:kreyno/models/reservation.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/views/client_tracking/widgets/tracking_course_widget.dart';
import 'package:kreyno/ui/widgets/dumb/lifecycle_manager.dart';
import 'package:stacked/stacked.dart';

import 'client_tracking_viewmodel.dart';

class ClientTrackingView extends StackedView<ClientTrackingViewModel> {
  const ClientTrackingView({
    Key? key,
    required this.parkingSpot,
    required this.reservation,
  }) : super(key: key);
  final ParkingSpot parkingSpot;
  final Reservation reservation;
  @override
  Widget builder(
    BuildContext context,
    ClientTrackingViewModel viewModel,
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
        child: Scaffold(
          body: Stack(
            children: [
              GoogleMap(
                scrollGesturesEnabled: true,
                zoomControlsEnabled: true,
                // polylines: viewModel.polyLines.toSet(),
                markers: {
                  Marker(
                    markerId: const MarkerId('user'),
                    icon: AssetMapBitmap("assets/images/point.png"),
                    position: LatLng(
                      viewModel.buyerLocation?.latitude.toDouble() ??
                          parkingSpot.latitude,
                      viewModel.buyerLocation?.longitude.toDouble() ??
                          parkingSpot.longitude,
                    ),
                  ),
                  Marker(
                    icon: AssetMapBitmap("assets/images/Map_pin.png"),

                    position: LatLng(
                      parkingSpot.latitude,
                      parkingSpot.longitude,
                    ),
                    markerId: MarkerId(parkingSpot.id.toString()),
                  ),
                },
                initialCameraPosition: CameraPosition(
                  target: LatLng(parkingSpot.latitude, parkingSpot.longitude),
                  zoom: 10,
                ),
              ),
              const TrackingCourseWidget(),
              // const MyMarkerDetails(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void onViewModelReady(ClientTrackingViewModel viewModel) {
    // TODO: implement onViewModelReady
    viewModel.initialise(reservation);
    super.onViewModelReady(viewModel);
  }

  @override
  ClientTrackingViewModel viewModelBuilder(BuildContext context) =>
      ClientTrackingViewModel();
}
