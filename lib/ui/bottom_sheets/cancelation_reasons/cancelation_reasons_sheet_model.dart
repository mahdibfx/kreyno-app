import 'package:flutter/material.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/app/app.router.dart';
import 'package:kreyno/models/reservation.dart';
import 'package:kreyno/services/reservations_service.dart';
import 'package:kreyno/services/toast_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CancelationReasonsSheetModel extends BaseViewModel {
  List<String> observations = [
    "J’ai changé mes plans",
    "J’ai fait une erreur",
    "Le/la client(e) est trop loin",
  ];

  final _reservationService = locator<ReservationsService>();
  final _toastService = locator<ToastService>();
  final _navigationService = locator<NavigationService>();
  String observation = "";
  bool isOtherSelected = false;
  final otherTextController = TextEditingController();

  cancelOrder(Reservation reservation) async {
    final result = await _reservationService.cancelReservation(
      reservation.id,
      observation,
    );
    result.match(
      (l) {
        _toastService.showError(title: l);
      },
      (r) {
        _navigationService.back();
        _navigationService.back();
        _reservationService.removeReservation();
      },
    );
  }
}
