import 'dart:ui';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/enums/reservation_status.dart';
import 'package:kreyno/models/reservation.dart';
import 'package:kreyno/services/location_service.dart';
import 'package:kreyno/services/reservations_service.dart';
import 'package:kreyno/services/toast_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SellerTrackingViewModel extends ReactiveViewModel {
  final _locationService = locator<LocationService>();
  final _toastService = locator<ToastService>();
  final _reservationService = locator<ReservationsService>();
  final _navigationService = locator<NavigationService>();
  ParkingPlace get parkingSpot => _parkingSpot!;
  Reservation get reservation => _reservation!;
  LatLng? currentLocation;

  ParkingPlace? _parkingSpot;
  Reservation? _reservation;

  onInit(Reservation reservation) {
    _reservation = reservation;
    _parkingSpot = reservation.parkingPlace;
    setBusy(true);
    _locationService.getCurrentLocation().then((value) {
      value.match(
        (l) {
          _toastService.showError(title: l);
        },
        (r) {
          currentLocation = LatLng(r.latitude, r.longitude);
          rebuildUi();
        },
      );
    });
    setBusy(false);
  }

  listenToReservationUpdates() {
    _reservationService.listenToReservationUpdates(_reservation!.id);
    listenableServices.first.addListener(() {
      if (_reservationService.reservation?.status ==
          ReservationStatus.canceled) {
        _reservationService.stopListeningToReservationUpdates(_reservation!.id);
        _reservationService.removeReservation();
        _navigationService.back();
        _toastService.showInfo(title: "Reservation annulée par le client");
      }
    });
  }

  @override
  // TODO: implement listenableServices
  List<ListenableServiceMixin> get listenableServices => [_reservationService];
}
