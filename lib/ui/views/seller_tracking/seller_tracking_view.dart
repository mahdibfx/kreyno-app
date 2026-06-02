import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kreyno/models/reservation.dart';
import 'package:kreyno/ui/views/home/widgets/buyer/buyer_waiting_confirmation.dart';
import 'package:kreyno/ui/widgets/dumb/lifecycle_manager.dart';
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
    print(viewModel.reservation.id.toString());
    // print(viewModel.reservation.parkingPlace.longitude.toString());
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
              viewModel.isBusy
                  ? const Center(child: CupertinoActivityIndicator())
                  : GoogleMap(
                      onMapCreated: (controller) {
                        viewModel.setMapController(controller);
                      },
                      polylines: viewModel.polylines,
                      markers: {
                        Marker(
                          icon: AssetMapBitmap(
                            reservation.parkingPlace.electricChargeStation
                                ? "assets/images/ev_charger_selected_marker.png"
                                : "assets/images/Map_pin.png",
                            width: 50,
                          ),

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

                        zoom: 12,
                      ),
                    ),
              const BuyerWaitingConfirmation(),
              // const MyMarkerDetails(),
            ],
          ),
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
