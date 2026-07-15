import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/app/app.router.dart';
import 'package:kreyno/app/app_constants.dart';
import 'package:kreyno/enums/reservation_status.dart';
import 'package:kreyno/models/parking_spot.dart';
import 'package:kreyno/models/reservation.dart';
import 'package:kreyno/models/user.dart';
import 'package:kreyno/services/location_service.dart';
import 'package:kreyno/services/parking_spots_service.dart';
import 'package:kreyno/services/reservations_service.dart';
import 'package:kreyno/services/toast_service.dart';
import 'package:kreyno/services/tracking_service.dart';
import 'package:kreyno/services/user_service.dart';
import 'package:kreyno/ui/views/home/home_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class MyLetPlaceViewModel extends ReactiveViewModel {
  final _navigationService = locator<NavigationService>();
  final _userService = locator<UserService>();
  final _reservationService = locator<ReservationsService>();
  final _parkingSpotsService = locator<ParkingSpotsService>();
  final _trackingService = locator<TrackingService>();

  final _toastService = locator<ToastService>();

  final otherTextController = TextEditingController();
  List<String> observations = [
    "cancelationReasons.changedPlans".tr(),
    "cancelationReasons.madeMistake".tr(),
    "cancelationReasons.clientTooFar".tr(),
  ];
  String observation = "";
  bool isOtherSelected = false;

  bool isRefused = false;
  User get currentUser => _userService.currentUser!;
  Reservation? get reservation => _reservationService.reservation;
  String get currentUserAvatarUrl =>
      currentUser.avatar?.url ?? AppConstants.defaultAvatarUrl;
  ParkingSpot? parkingSpot;

  String get distanceToSpot {
    final currentLocation = locator<LocationService>().currentLocation;
    if (currentLocation == null || reservation == null) return "0 km";
    final distanceInMeters = Geolocator.distanceBetween(
      currentLocation.latitude,
      currentLocation.longitude,
      reservation!.parkingPlace.latitude,
      reservation!.parkingPlace.longitude,
    );
    return "∼${(distanceInMeters / 1000).toStringAsFixed(1)} km";
  }

  String get timeToSpot {
    final currentLocation = locator<LocationService>().currentLocation;
    if (currentLocation == null || reservation == null) return "0 min";
    final distanceInMeters = Geolocator.distanceBetween(
      currentLocation.latitude,
      currentLocation.longitude,
      reservation!.parkingPlace.latitude,
      reservation!.parkingPlace.longitude,
    );
    // Assuming average speed of 30 km/h = 8.33 m/s
    final timeInSeconds = distanceInMeters / 8.33;
    final timeInMinutes = (timeInSeconds / 60).ceil();
    return "∼$timeInMinutes minutes";
  }

  onStatusChanged() async {
    // This fires from the shared ReservationsService. It can be notified right
    // after the reservation was cleared (e.g. ClientTrackingViewModel.dispose
    // calls removeReservation), so reservation may be null here. Guard against
    // that and against running on an already-disposed view model.
    if (disposed) return;
    if (_reservationService.reservation?.status == ReservationStatus.canceled) {
      _reservationService.removeReservation();
      notifyListeners();
      _toastService.showInfo(title: "common.reservationCanceled".tr());
    }
  }

  onReservationReceived() {
    _reservationService.listenToReservationStatusChanged(currentUser.id);
    _reservationService.removeListener(onStatusChanged);
    _reservationService.addListener(onStatusChanged);
  }

  initialise() {
    parkingSpot = _navigationService.currentArguments as ParkingSpot;

    // The resume flow (active place fetched on app start) seeds the service
    // with the in-progress reservation before navigating here. Keep it when it
    // belongs to this spot; otherwise clear whatever stale reservation the
    // service may still hold.
    final seeded = _reservationService.reservation;
    final hasSeededReservation =
        seeded != null &&
        seeded.parkingPlace.id == parkingSpot!.id &&
        (seeded.status == ReservationStatus.pending ||
            seeded.status == ReservationStatus.confirmed);
    if (!hasSeededReservation) {
      _reservationService.removeReservation();
    }

    _reservationService.listenToReservationUpdates(currentUser.id);

    _reservationService.addListener(onReservationReceived);

    // A seeded reservation never fires the listener above (it arrived via the
    // API, not the socket), so wire the status-change subscription manually —
    // exactly what onReservationReceived would do for a live one.
    if (hasSeededReservation) {
      onReservationReceived();
    }

    // Subscribe to the seller's channel so we know when the backend deletes
    // this place (e.g. its time ran out) and can leave this screen.
    _trackingService.listenToPlaceDeleted(currentUser.id);
    _trackingService.addPlaceDeletedListener(_onPlaceDeleted);

    notifyListeners();
  }

  /// Fired when a `parking-place.deleted` event arrives for this seller. If the
  /// deleted place is the one we're showing, leave the screen. Ignored while a
  /// reservation is in progress, since a reserved spot is not an expiry case.
  void _onPlaceDeleted(int parkingPlaceId) {
    if (disposed || parkingSpot == null) return;
    if (reservation != null) return;
    if (parkingPlaceId != parkingSpot!.id) return;
    _navigationService.back();
    // _toastService.showError(title: "myLetPlace.placeExpired".tr());
  }

  acceptOrder() async {
    final result = await _reservationService.confirmReservation(
      reservation!.id,
    );
    result.match((l) => _toastService.showError(title: l), (r) {
      _toastService.showInfo(title: "common.confirmedSuccessfully".tr());
      _navigationService.navigateToClientTrackingView(
        parkingSpot: parkingSpot!,
        reservation: reservation!,
      );
    });
  }

  refuseOrder() {
    isRefused = true;
    rebuildUi();

    observation = observations.first;
    rebuildUi();
  }

  removePlace() async {
    final result = await _parkingSpotsService.deleteParkingSpot(
      parkingSpot!.id,
    );
    result.match(
      (error) {
        _toastService.showError(title: error);
      },
      (value) {
        _navigationService.clearStackAndShowView(const HomeView());
      },
    );
  }

  cancelOrder() async {
    final result = await _reservationService.cancelReservation(
      reservation!.id,
      observation,
    );
    result.match((l) => _toastService.showError(title: l), (r) {
      isRefused = false;
      notifyListeners();
      _reservationService.removeReservation();
      // _navigationService.back();
    });
  }

  disposeSocketService() {
    _reservationService.disconnectSocket();
  }

  @override
  void dispose() {
    _reservationService.removeListener(onReservationReceived);
    _reservationService.removeListener(onStatusChanged);
    _trackingService.removePlaceDeletedListener(_onPlaceDeleted);
    super.dispose();
  }

  @override
  // TODO: implement listenableServices
  List<ListenableServiceMixin> get listenableServices => [
    _userService,
    _reservationService,
  ];
}
