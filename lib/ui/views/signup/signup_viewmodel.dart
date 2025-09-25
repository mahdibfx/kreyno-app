import 'package:flutter/material.dart';
import 'package:kreyno/app/app.bottomsheets.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/app/app.logger.dart';
import 'package:kreyno/app/app.router.dart';
import 'package:kreyno/enums/unique_existence_id.dart';
import 'package:kreyno/services/auth_service.dart';
import 'package:kreyno/services/toast_service.dart';
import 'package:kreyno/ui/views/signup/signup_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SignupViewModel extends FormViewModel {
  final _logger = getLogger('SignupViewModel');
  final _navigationService = locator<NavigationService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _authService = locator<AuthService>();
  final _toastService = locator<ToastService>();

  bool get isFormValid =>
      (hasPhoneNumber &&
          hasFirstName &&
          hasLastName &&
          hasEmail &&
          hasUserName &&
          hasAddress) &&
      (hasPhoneNumberValidationMessage == false &&
          hasFirstNameValidationMessage == false &&
          hasLastNameValidationMessage == false &&
          hasEmailValidationMessage == false &&
          hasUserNameValidationMessage == false &&
          hasAddressValidationMessage == false);

  bool _isMale = true;
  bool get isMale => _isMale;

  DateTime? _selectedBirthday;
  DateTime? get selectedBirthday => _selectedBirthday;

  late String _countryDialCode;
  String get countryDialCode => _countryDialCode;

  String get fullPhoneNumber =>
      '${countryDialCode.trim()}${phoneNumberValue?.trim()}';

  void setCountryDialCode(String countryDialCode) {
    _logger.d('setCountryDialCode: $countryDialCode');
    _countryDialCode = countryDialCode;
  }

  void setIsMale(bool value) {
    if (value == _isMale) return;
    _isMale = value;
    rebuildUi();
  }

  void onBirthdayChanged(DateTime birthday) {
    _logger.d('onBirthdayChanged: $birthday');
    _selectedBirthday = birthday;
    rebuildUi();
  }

  void goBack() {
    _navigationService.back();
  }

  void onCtaTapped() async {
    // final response = await _authService.checkIfUserExists(
    //   attribute: UniqueExistenceId.phone,
    //   value: fullPhoneNumber,
    // );
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
