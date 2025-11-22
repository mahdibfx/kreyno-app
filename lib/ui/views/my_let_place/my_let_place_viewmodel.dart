import 'package:flutter/material.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/app/app_constants.dart';
import 'package:kreyno/models/parking_spot.dart';
import 'package:kreyno/models/reservation.dart';
import 'package:kreyno/models/user.dart';
import 'package:kreyno/services/parking_spots_service.dart';
import 'package:kreyno/services/reservations_service.dart';
import 'package:kreyno/services/toast_service.dart';
import 'package:kreyno/services/user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class MyLetPlaceViewModel extends ReactiveViewModel {
  final _navigationService = locator<NavigationService>();
  final _userService = locator<UserService>();
  final _reservationService = locator<ReservationsService>();
  final _parkingSpotsService = locator<ParkingSpotsService>();

  final _toastService = locator<ToastService>();

  final otherTextController = TextEditingController();
  List<String> observations = [
    "J’ai changé mes plans",
    "J’ai fait une erreur",
    "Le/la client(e) est trop loin",
  ];
  String observation = "";
  bool isOtherSelected = false;

  bool isRefused = false;
  User get currentUser => _userService.currentUser!;
  Reservation? get reservation => _reservationService.reservation;
  String get currentUserAvatarUrl =>
      currentUser.avatar?.url ?? AppConstants.defaultAvatarUrl;
  ParkingSpot? parkingSpot;

  initialise() {
    _reservationService.listenToReservationUpdates(currentUser.id);

    parkingSpot = _navigationService.currentArguments as ParkingSpot;
    notifyListeners();
  }

  refuseOrder() {
    isRefused = true;
    observation = observations.first;
    notifyListeners();
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
        _toastService.showInfo(title: "Deleted succesfuly ");
        _navigationService.back();
        _navigationService.back();
      },
    );
  }

  cancelOrder() async {
    final result = await _reservationService.cancelReservation(
      reservation!.id,
      observation,
    );
    result.match((l) => _toastService.showError(title: l), (r) {
      _navigationService.back();
    });
  }

  @override
  void addListener(VoidCallback listener) {
    // TODO: implement addListener
    if (isOtherSelected) super.addListener(listener);
  }

  @override
  // TODO: implement listenableServices
  List<ListenableServiceMixin> get listenableServices => [
    _userService,
    _reservationService,
  ];
}
