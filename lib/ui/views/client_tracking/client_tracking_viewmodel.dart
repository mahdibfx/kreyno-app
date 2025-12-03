import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:geolocator/geolocator.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/app/app.router.dart';
import 'package:kreyno/app/app_constants.dart';
import 'package:kreyno/models/buyer_location_updated.dart';
import 'package:kreyno/models/reservation.dart';
import 'package:kreyno/services/location_service.dart';
import 'package:kreyno/services/reservations_service.dart';
import 'package:kreyno/services/toast_service.dart';
import 'package:kreyno/services/tracking_service.dart';
import 'package:kreyno/services/user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ClientTrackingViewModel extends ReactiveViewModel {
  final _trackingService = locator<TrackingService>();
  final _userService = locator<UserService>();
  final _reservationsService = locator<ReservationsService>();
  final _navigationService = locator<NavigationService>();
  final _toastService = locator<ToastService>();
  final _locationService = locator<LocationService>();

  get userId => _userService.currentUser?.id;
  BuyerLocationUpdated? get buyerLocation =>
      _trackingService.buyerLocationUpdated;
  bool get buyerArrived =>
      _trackingService.buyerLocationUpdated?.arrived ?? false;
  bool cancelButtonDisabled = true;
  String remainingTime = "05:00";
  int remainingSeconds = 0;
  int seconds = 0;
  Timer? _timer;
  Reservation? reservation;

  String get distanceToSpot {
    final currentLocation = _locationService.currentLocation;
    if (currentLocation == null || reservation == null) return "0 km";
    final distanceInMeters = Geolocator.distanceBetween(
      currentLocation.latitude,
      currentLocation.longitude,
      reservation!.parkingPlace.latitude,
      reservation!.parkingPlace.longitude,
    );
    return "${(distanceInMeters / 1000).toStringAsFixed(1)} km";
  }

  goToChat() {
    _navigationService.navigateToChatView(
      reservationId: reservation!.id,
      id: reservation!.id,
      name: reservation!.buyer.username,
      image: reservation!.buyer.avatar?.url ?? AppConstants.defaultAvatarUrl,
      phone: reservation!.buyer.phone,
    );
  }

  String formatSecondsToMMSS(int totalSeconds) {
    final minutes = totalSeconds ~/ 60; // integer division
    final seconds = totalSeconds % 60;

    final minutesStr = minutes.toString().padLeft(2, '0');
    final secondsStr = seconds.toString().padLeft(2, '0');

    return '$minutesStr:$secondsStr';
  }

  void initialise(Reservation kReservation) {
    reservation = kReservation;
    seconds = 1 * 60;
    remainingSeconds = seconds - 1;

    _trackingService.listenToBuyerLocation(userId);
    Timer(Duration(seconds: seconds), () {
      cancelButtonDisabled = false;

      _timer!.cancel();
      notifyListeners();
    });
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      remainingSeconds--;
      remainingTime = formatSecondsToMMSS(remainingSeconds);
      rebuildUi();
    });
  }

  Future<void> completeReservation() async {
    // _navigationService.navigateToSpotSoldSuccessView();
    // return;
    final result = await _reservationsService.completeReservation(
      reservation!.id,
    );

    result.match((l) => _toastService.showError(title: l), (r) {
      _navigationService.navigateToSpotSoldSuccessView(
        reservation: reservation!,
      );
    });
  }

  @override
  // TODO: implement listenableServices
  List<ListenableServiceMixin> get listenableServices => [_trackingService];
}
