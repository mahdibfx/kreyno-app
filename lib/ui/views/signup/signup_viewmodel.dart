import 'package:flutter/material.dart';
import 'package:kreyno/app/app.bottomsheets.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SignupViewModel extends FormViewModel {
  final _navigationService = locator<NavigationService>();
  final _bottomSheetService = locator<BottomSheetService>();

  bool _isMale = true;
  bool get isMale => _isMale;

  DateTime? _selectedBirthday;
  DateTime? get selectedBirthday => _selectedBirthday;

  void setIsMale(bool value) {
    if (value == _isMale) return;
    _isMale = value;
    rebuildUi();
  }

  void onBirthdayChanged(DateTime birthday) {
    _selectedBirthday = birthday;
    rebuildUi();
  }

  void goBack() {
    _navigationService.back();
  }

  void showOtpSheet() async {
    final response = await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.otp,
      barrierColor: Colors.black.withValues(alpha: .1),
      isScrollControlled: true,
    );

    if (response != null && response.confirmed) {
      _navigationService.navigateToSetUpVehiculeView();
    }
  }
}
