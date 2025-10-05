import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kreyno/app/app.bottomsheets.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/app/app.logger.dart';
import 'package:kreyno/enums/gender.dart';
import 'package:kreyno/enums/otp_sheet_type.dart';
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
      (hasPhoneNumber && hasFirstName && hasLastName && hasEmail && hasUserName
      //  && hasAddress
      ) &&
      (hasPhoneNumberValidationMessage == false &&
          hasFirstNameValidationMessage == false &&
          hasLastNameValidationMessage == false &&
          hasEmailValidationMessage == false &&
          hasUserNameValidationMessage == false
      // && hasAddressValidationMessage == false
      );

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

  bool _userNameAllowed = false;
  bool get userNameAllowed => _userNameAllowed;

  bool _emailAllowed = false;
  bool get emailAllowed => _emailAllowed;

  Timer? _userNameDebounceTimer;
  Timer? _emailDebounceTimer;

  void setCheckingUserNameTaken(bool value) {
    if (value == _checkingUserNameTaken) return;
    _checkingUserNameTaken = value;
    rebuildUi();
  }

  void setUserNameAllowed(bool value) {
    if (value == _userNameAllowed) return;
    _userNameAllowed = value;
    rebuildUi();
  }

  void setEmailAllowed(bool value) {
    if (value == _emailAllowed) return;
    _emailAllowed = value;
    rebuildUi();
  }

  void setCheckingEmailTaken(bool value) {
    if (value == _checkingEmailTaken) return;
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
  }

  void goBack() {
    _navigationService.back();
  }

  void onUserNameChanged(String value) {
    setUserNameAllowed(false);
    _userNameDebounceTimer?.cancel();
    // Only start timer if username has value and no validation errors
    if (value.isNotEmpty && hasUserName && !hasUserNameValidationMessage) {
      _userNameDebounceTimer = Timer(const Duration(milliseconds: 500), () {
        _handleUserNameIsTaken();
      });
    }
  }

  void onEmailChanged(String value) {
    setEmailAllowed(false);
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
    try {
      var response = await _authService.checkIfUserExists(
        attribute: UniqueExistenceId.username,
        value: userNameValue!,
      );
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
          } else {
            setUserNameAllowed(true);
          }
        },
      );
    } finally {
      setCheckingUserNameTaken(false);
    }
  }

  void _handleEmailIsTaken() async {
    setCheckingEmailTaken(true);
    try {
      var response = await _authService.checkIfUserExists(
        attribute: UniqueExistenceId.email,
        value: emailValue!,
      );
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
          } else {
            setEmailAllowed(true);
          }
        },
      );
    } finally {
      setCheckingEmailTaken(false);
    }
  }

  void sendOtp() async {
    setBusy(true);
    try {
      final response = await _authService.sendOtp(fullPhoneNumber);
      await response.match(
        (errorMessage) async {
          _logger.e('Error sending otp', error: errorMessage);
          _toastService.showError(title: errorMessage);
        },
        (success) async {
          await _showOtpSheet();
        },
      );
    } finally {
      setBusy(false);
    }
  }

  Future<void> _showOtpSheet() async {
    await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.otp,
      barrierColor: Colors.black.withValues(alpha: .1),
      isScrollControlled: true,
      data: [
        OtpSheetType.signup,
        (
          phoneNumber: fullPhoneNumber,
          firstName: firstNameValue!.trim(),
          lastName: lastNameValue!.trim(),
          email: emailValue!.trim(),
          // address: addressValue?.trim(),
          userName: userNameValue!.trim(),
          gender: isMale ? Gender.male : Gender.female,
          birthDate: selectedBirthday!,
        ),
      ],
    );
  }

  @override
  void dispose() {
    _userNameDebounceTimer?.cancel();
    _emailDebounceTimer?.cancel();
    super.dispose();
  }
}
