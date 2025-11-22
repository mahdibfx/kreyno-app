import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kreyno/models/parking_spot.dart';
import 'package:kreyno/models/reservation.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/views/client_tracking/widgets/tracking_course_widget.dart';
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
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            scrollGesturesEnabled: false,
            zoomControlsEnabled: false,
            polylines: {
              Polyline(
                width: 3,
                color: AppColors.greenKre,
                jointType: JointType.round,
                startCap: Cap.roundCap,
                endCap: Cap.roundCap,

                polylineId: const PolylineId('userd'),
                points: [
                  LatLng(
                    viewModel.buyerLocation?.longitude ?? parkingSpot.longitude,
                    viewModel.buyerLocation?.latitude ?? parkingSpot.latitude,
                  ),
                  LatLng(parkingSpot.latitude, parkingSpot.longitude),
                ],
              ),
            },
            markers: {
              Marker(
                icon: AssetMapBitmap("assets/images/Map_pin.png"),

                position: LatLng(parkingSpot.latitude, parkingSpot.longitude),
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
