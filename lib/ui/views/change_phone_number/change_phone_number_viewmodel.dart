import 'package:flutter/material.dart';
import 'package:kreyno/app/app.bottomsheets.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ChangePhoneNumberViewModel extends BaseViewModel {
  goBack() {
    locator<NavigationService>().back();
  }

  void showOtpSheet() async {
    final response = await locator<BottomSheetService>().showCustomSheet(
      variant: BottomSheetType.otp,
      barrierColor: Colors.black.withValues(alpha: .1),
      isScrollControlled: true,
    );
  }
}
