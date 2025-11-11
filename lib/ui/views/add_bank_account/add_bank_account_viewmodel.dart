import 'package:flutter/material.dart';
import 'package:kreyno/app/app.bottomsheets.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/app/app.logger.dart';
import 'package:kreyno/dtos/create_stripe_account_dto.dart';
import 'package:kreyno/models/user.dart';
import 'package:kreyno/services/stripe_service.dart';
import 'package:kreyno/services/toast_service.dart';
import 'package:kreyno/services/user_service.dart';
import 'package:kreyno/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:kreyno/ui/views/add_bank_account/add_bank_account_view.form.dart';

class AddBankAccountViewModel extends ReactiveViewModel with FormStateHelper {
  final _logger = getLogger('AddBankAccountViewModel');
  final _navigationService = locator<NavigationService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _userService = locator<UserService>();
  final _stripeService = locator<StripeService>();
  final _toastService = locator<ToastService>();

  User get currentUser => _userService.currentUser!;

  String _countryCode = '';

  void onConfirmIbanChanged(String value) {
    if (value.trim().isNotEmpty) {
      if (value.trim().toUpperCase() != ibanValue?.trim().toUpperCase()) {
        setConfirmIbanValidationMessage(AddBankAccountStrings.ibanMismatch);
      } else {
        setConfirmIbanValidationMessage(null);
      }
    }
    rebuildUi();
  }

  void initializeForm() {
    lastNameValue = currentUser.lastName;
    firstNameValue = currentUser.firstName;
    emailValue = currentUser.email;
    rebuildUi();
  }

  void goBack() {
    _navigationService.back();
  }

  void onCountryTapped() async {
    final response = await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.countryCodePicker,
      barrierColor: Colors.black.withValues(alpha: .1),
      ignoreSafeArea: false,
      isScrollControlled: true,
      data: false, // showPhoneCode parameter
    );

    if (response != null && response.confirmed) {
      final (dialCode, code, name) = response.data as (String, String, String);
      _logger.i('country code selected: $dialCode $code ($name)');
      _countryCode = code;
      countryValue = name;
      rebuildUi();
    }
  }

  void onCtaTapped() async {
    if (isFormValid) {
      setBusy(true);
      try {
        final response = await _stripeService.createAccount(
          CreateStripeAccountDto(
            country: _countryCode,
            email: emailValue!,
            street: addressValue!,
            city: cityValue!,
            state: regionValue!,
            postalCode: postalCodeValue!,
            iban: ibanValue!,
            accountHolderName: '${firstNameValue!} ${lastNameValue!}',
          ),
        );

        response.match(
          (error) {
            _logger.e('error creating bank account: $error');
            _toastService.showError(title: error);
          },
          (wallet) {
            _navigationService.back(result: wallet);
          },
        );
      } finally {
        setBusy(false);
      }
    }
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_userService];
}
