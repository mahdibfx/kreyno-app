import 'dart:math';

import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/enums/reservation_status.dart';
import 'package:kreyno/models/reservation.dart';
import 'package:kreyno/services/location_service.dart';
import 'package:kreyno/services/reservations_service.dart';
import 'package:kreyno/services/toast_service.dart';
import 'package:kreyno/services/user_service.dart';
import 'package:kreyno/ui/views/spot_bought_success/spot_bought_success_view.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SellerTrackingViewModel extends ReactiveViewModel {
  final _locationService = locator<LocationService>();
  final _toastService = locator<ToastService>();
  late GoogleMapController googleController;

  final _reservationService = locator<ReservationsService>();
  final _navigationService = locator<NavigationService>();
  ParkingPlace get parkingSpot => _parkingSpot!;
  Reservation get reservation => _reservation!;
  LatLng? get currentLocationStream => _locationService.currentLocation;

  LatLng? currentLocation;

  ParkingPlace? _parkingSpot;
  Reservation? _reservation;
  bool _isArrived = false;
  bool get isArrived => _isArrived;
  bool _nearParkingSpotLocation = false;
  bool get nearParkingSpotLocation => _nearParkingSpotLocation;
  setMapController(GoogleMapController controller) {
    googleController = controller;
    rebuildUi();
  }

  String get distanceToSpot {
    if (currentLocationStream == null || _parkingSpot == null) return "0 km";
    final distanceInMeters = Geolocator.distanceBetween(
      currentLocationStream!.latitude,
      currentLocationStream!.longitude,
      _parkingSpot!.latitude,
      _parkingSpot!.longitude,
    );
    return "${(distanceInMeters / 1000).toStringAsFixed(1)} km";
  }

  String get timeToSpot {
    if (currentLocationStream == null || _parkingSpot == null) return "0 min";
    final distanceInMeters = Geolocator.distanceBetween(
      currentLocationStream!.latitude,
      currentLocationStream!.longitude,
      _parkingSpot!.latitude,
      _parkingSpot!.longitude,
    );
    // Assuming average speed of 30 km/h = 8.33 m/s
    final timeInSeconds = distanceInMeters / 8.33;
    final timeInMinutes = (timeInSeconds / 60).ceil();
    return "$timeInMinutes min";
  }

  setArrived() {
    _isArrived = true;
    rebuildUi();
  }

  buyerLocationChanged() async {
    final result = await _reservationService.buyerChangedLocation(
      _reservation!.id,
      currentLocationStream!,
      false,
    );

    result.match(
      (l) {
        _toastService.showError(title: l);
      },
      (r) {
        rebuildUi();
      },
    );
  }

  confirmMonArrival() async {
    final result = await _reservationService.buyerChangedLocation(
      _reservation!.id,
      currentLocationStream!,
      true,
    );

    result.match(
      (l) {
        _toastService.showError(title: l);
      },
      (r) {
        _isArrived = true;
        rebuildUi();
      },
    );
  }

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
          listenToReservationUpdates();
          rebuildUi();
        },
      );
    });
    setBusy(false);
  }

  listenToReservationUpdates() {
    _reservationService.listenToReservationStatusChanged(
      locator<UserService>().currentUser!.id,
    );
    listenableServices.first.addListener(() {
      if (_reservationService.reservation?.status ==
          ReservationStatus.canceled) {
        _reservationService.stopListeningToReservationUpdates(_reservation!.id);
        _reservationService.removeReservation();
        _navigationService.back();
        _navigationService.back();

        // _toastService.showError(title: "clientCanceledOrder.title".tr());
      } else if (_reservationService.reservation?.status ==
          ReservationStatus.confirmed) {
        _locationService.listenToMyLocationReactive();
        _toastService.showInfo(
          title: "sellerTracking.reservationConfirmed".tr(),
          description: "sellerConfirmedForBuyer.cancellationPolicy".tr(),
          duration: const Duration(seconds: 5),
        );
        _reservation = _reservationService.reservation;
        notifyListeners();
      } else if (_reservationService.reservation?.status ==
          ReservationStatus.finished) {
        _navigationService.clearTillFirstAndShowView(
          SpotBoughtSuccessView(reservation: reservation),
        );
      }
    });

    listenableServices.last.addListener(() {
      final LatLng parkingSpotLocation = LatLng(
        _parkingSpot!.latitude,
        _parkingSpot!.longitude,
      );
      _nearParkingSpotLocation = isCloseTo(
        currentLocation!,
        parkingSpotLocation,
        500,
      );

      print("called here : $_nearParkingSpotLocation");

      googleController.animateCamera(
        CameraUpdate.newLatLngZoom(currentLocationStream!, 15),
      );
      rebuildUi();
    });
  }

  bool isCloseTo(LatLng location, LatLng parkingSpotLocation, double radius) {
    const double earthRadius = 6371000; // meters

    double lat1Rad = _degreesToRadians(location.latitude);
    double lon1Rad = _degreesToRadians(location.longitude);
    double lat2Rad = _degreesToRadians(parkingSpotLocation.latitude);
    double lon2Rad = _degreesToRadians(parkingSpotLocation.longitude);

    double dLat = lat2Rad - lat1Rad;
    double dLon = lon2Rad - lon1Rad;

    double a =
        _sinSquared(dLat / 2) +
        cos(lat1Rad) * cos(lat2Rad) * _sinSquared(dLon / 2);
    double c = 2 * atan2(sqrt(a), sqrt(1 - a));
    double distance = earthRadius * c;

    return distance <= radius;
  }

  double _degreesToRadians(double degrees) {
    return degrees * pi / 180;
  }

  double _sinSquared(double x) {
    return sin(x) * sin(x);
  }

  @override
  // TODO: implement listenableServices
  List<ListenableServiceMixin> get listenableServices => [
    _reservationService,
    _locationService,
  ];
}
