import 'package:flutter/cupertino.dart';
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
    print(viewModel.nearParkingSpotLocation);

    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Stack(
          children: [
            viewModel.isBusy
                ? const Center(child: CupertinoActivityIndicator())
                : GoogleMap(
                    onMapCreated: (controller) {
                      viewModel.setMapController(controller);
                    },
                    polylines: {
                      Polyline(
                        width: 3,
                        color: AppColors.greenKre,
                        jointType: JointType.round,
                        startCap: Cap.roundCap,
                        endCap: Cap.roundCap,

                        polylineId: const PolylineId('3'),
                        points: [
                          LatLng(
                            viewModel.currentLocationStream!.latitude,
                            viewModel.currentLocationStream!.longitude,
                          ),
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
                        markerId: MarkerId(
                          reservation.parkingPlace.id.toString(),
                        ),
                      ),

                      Marker(
                        markerId: const MarkerId('user'),
                        icon: AssetMapBitmap("assets/images/point.png"),
                        position: LatLng(
                          viewModel.currentLocationStream!.latitude,
                          viewModel.currentLocationStream!.longitude,
                        ),
                      ),
                    },
                    initialCameraPosition: CameraPosition(
                      target: LatLng(
                        viewModel.currentLocationStream!.latitude,
                        viewModel.currentLocationStream!.longitude,
                      ),

                      zoom: 10,
                    ),
                  ),
            const BuyerWaitingConfirmation(),
            // const MyMarkerDetails(),
          ],
        ),
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
