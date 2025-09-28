import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kreyno/app/app.bottomsheets.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/app/app.logger.dart';
import 'package:kreyno/app/app.router.dart';
import 'package:kreyno/enums/unique_existence_id.dart';
import 'package:kreyno/services/auth_service.dart';
import 'package:kreyno/services/toast_service.dart';
import 'package:kreyno/ui/common/app_strings.dart';
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

  bool _checkingUserNameTaken = false;
  bool get checkingUserNameTaken => _checkingUserNameTaken;

  bool _checkingEmailTaken = false;
  bool get checkingEmailTaken => _checkingEmailTaken;

  Timer? _userNameDebounceTimer;
  Timer? _emailDebounceTimer;

  void setCheckingUserNameTaken(bool value) {
    _checkingUserNameTaken = value;
    rebuildUi();
  }

  void setCheckingEmailTaken(bool value) {
    _checkingEmailTaken = value;
    rebuildUi();
  }

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

  void onUserNameChanged(String value) {
    _userNameDebounceTimer?.cancel();
    // Only start timer if username has value and no validation errors
    if (value.isNotEmpty && hasUserName && !hasUserNameValidationMessage) {
      _userNameDebounceTimer = Timer(const Duration(milliseconds: 500), () {
        _handleUserNameIsTaken();
      });
    }
  }

  void onEmailChanged(String value) {
    _emailDebounceTimer?.cancel();
    // Only start timer if email has value and no validation errors
    if (value.isNotEmpty && hasEmail && !hasEmailValidationMessage) {
      _emailDebounceTimer = Timer(const Duration(milliseconds: 500), () {
        _handleEmailIsTaken();
      });
    }
  }

  void _handleUserNameIsTaken() async {
    setCheckingUserNameTaken(true);
    var response = await _authService.checkIfUserExists(
      attribute: UniqueExistenceId.username,
      value: userNameValue!,
    );
    setCheckingUserNameTaken(false);
    response.match(
      (errorMessage) {
        _logger.e(
          'Error checking if user with username exists',
          error: errorMessage,
        );
        _toastService.showError(title: errorMessage, showIcon: true);
      },
      (exists) {
        if (exists) {
          setUserNameValidationMessage(SignupStrings.userNameTaken);
        }
      },
    );
  }

  void _handleEmailIsTaken() async {
    setCheckingEmailTaken(true);
    var response = await _authService.checkIfUserExists(
      attribute: UniqueExistenceId.email,
      value: emailValue!,
    );
    setCheckingEmailTaken(false);
    response.match(
      (errorMessage) {
        _logger.e(
          'Error checking if user with email exists',
          error: errorMessage,
        );
        _toastService.showError(title: errorMessage, showIcon: true);
      },
      (exists) {
        if (exists) {
          setEmailValidationMessage(SignupStrings.emailTaken);
        }
      },
    );
  }

  void sendOtp() async {
    setBusy(true);
    final response = await _authService.sendOtp(fullPhoneNumber);
    setBusy(false);
    response.match((errorMessage) {
      _logger.e('Error sending otp', error: errorMessage);
      _toastService.showError(title: errorMessage);
    }, (success) => _showOtpSheet());
  }

  void _showOtpSheet() async {
    final response = await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.otp,
      barrierColor: Colors.black.withValues(alpha: .1),
      isScrollControlled: true,
    );

    if (response != null && response.confirmed) {
      _navigationService.navigateToSetUpVehiculeView();
    }
  }

  @override
  void dispose() {
    _userNameDebounceTimer?.cancel();
    _emailDebounceTimer?.cancel();
    super.dispose();
  }
}
