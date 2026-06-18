import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/models/reservation.dart';
import 'package:kreyno/services/reservations_service.dart';
import 'package:kreyno/services/toast_service.dart';
import 'package:kreyno/ui/views/home/home_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CancelationReasonsSheetModel extends BaseViewModel {
  List<String> observations = [
    "cancelationReasons.changedPlans".tr(),
    "cancelationReasons.madeMistake".tr(),
    "cancelationReasons.clientTooFar".tr(),
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
        // Cancellation succeeded: clear the reservation and leave the tracking
        // screen instead of just closing the sheet (which left the seller stuck
        // on a now-cancelled tracking view).
        _reservationService.removeReservation();
        _navigationService.clearStackAndShowView(const HomeView());
      },
    );
  }
}
