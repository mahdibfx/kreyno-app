import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kreyno/models/parking_spot.dart';
import 'package:kreyno/models/reservation.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/views/home/widgets/buyer/buyer_waiting_confirmation.dart';
import 'package:stacked/stacked.dart';

import 'seller_tracking_viewmodel.dart';

class SellerTrackingView extends StackedView<SellerTrackingViewModel> {
  const SellerTrackingView({Key? key, required this.reservation})
    : super(key: key);

  final Reservation reservation;

  @override
  Widget builder(
    BuildContext context,
    SellerTrackingViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            // scrollGesturesEnabled: false,
            // zoomControlsEnabled: false,
            polylines: {
              Polyline(
                width: 3,
                color: AppColors.greenKre,
                jointType: JointType.round,
                startCap: Cap.roundCap,
                endCap: Cap.roundCap,

                polylineId: const PolylineId('userd'),
                points: [
                  // LatLng(
                  //   viewModel.buyerLocation?.longitude ?? parkingSpot.longitude,
                  //   viewModel.buyerLocation?.latitude ?? parkingSpot.latitude,
                  // ),
                  // LatLng(parkingSpot.latitude, parkingSpot.longitude),
                  const LatLng(31.0444, 29.9510),
                  LatLng(
                    reservation.parkingPlace.latitude,
                    reservation.parkingPlace.longitude,
                  ),
                ],
              ),
            },
            markers: {
              Marker(
                icon: AssetMapBitmap("assets/images/Map_pin.png"),

                position: LatLng(
                  reservation.parkingPlace.latitude,
                  reservation.parkingPlace.longitude,
                ),
                markerId: MarkerId(reservation.parkingPlace.id.toString()),
              ),
            },
            initialCameraPosition: CameraPosition(
              target: LatLng(
                reservation.parkingPlace.latitude,
                reservation.parkingPlace.longitude,
              ),

              zoom: 14,
            ),
          ),
          const BuyerWaitingConfirmation(),
          // const MyMarkerDetails(),
        ],
      ),
    );
  }

  @override
  void onViewModelReady(SellerTrackingViewModel viewModel) {
    // TODO: implement onViewModelReady
    viewModel.onInit(reservation);
    super.onViewModelReady(viewModel);
  }

  @override
  SellerTrackingViewModel viewModelBuilder(BuildContext context) =>
      SellerTrackingViewModel();
}
