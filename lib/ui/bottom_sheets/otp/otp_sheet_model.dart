import 'dart:async';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/app/app.logger.dart';
import 'package:kreyno/app/app.router.dart';
import 'package:kreyno/enums/gender.dart';
import 'package:kreyno/enums/onboarding_step.dart';
import 'package:kreyno/services/auth_service.dart';
import 'package:kreyno/services/onboarding_service.dart';
import 'package:kreyno/services/toast_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../enums/otp_sheet_type.dart';

class OtpSheetModel extends BaseViewModel {
  final _logger = getLogger('OtpSheetModel');
  final _navigationService = locator<NavigationService>();
  final _authService = locator<AuthService>();
  final _toastService = locator<ToastService>();
  final _onboardingService = locator<OnboardingService>();

  final OtpSheetType type;
  final String phoneNumber;

  final String? firstName;
  final String? lastName;
  final String? email;
  final String? address;
  final String? userName;
  final Gender? gender;
  final DateTime? birthDate;

  OtpSheetModel.signin({required this.phoneNumber})
    : type = OtpSheetType.signin,
      firstName = null,
      lastName = null,
      email = null,
      address = null,
      userName = null,
      gender = null,
      birthDate = null;

  OtpSheetModel.signup({
    required this.phoneNumber,
    required this.firstName,
    required this.lastName,
    required this.userName,
    required this.email,
    this.address,
    required this.birthDate,
    required this.gender,
  }) : type = OtpSheetType.signup;

  OtpSheetModel.updatePhoneNumber({required this.phoneNumber})
    : type = OtpSheetType.updatePhoneNumber,
      firstName = null,
      lastName = null,
      email = null,
      address = null,
      userName = null,
      gender = null,
      birthDate = null;

  Timer? _timer;
  int _remainingTime = 60;

  int get remainingTime => _remainingTime;
  bool get canResendCode => _remainingTime == 0;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  void setErrorMessage(String errorMessage) {
    _errorMessage = errorMessage;
    rebuildUi();
  }

  void startTimer() {
    _remainingTime = 60;
    rebuildUi();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingTime > 0) {
        _remainingTime--;
        rebuildUi();
      } else {
        _timer?.cancel();
      }
    });
  }

  void resendCode() async {
    if (canResendCode) {
      final response = await _authService.sendOtp(phoneNumber);

      response.match(
        (errorMessage) {
          _logger.e('Error sending otp', error: errorMessage);
          setErrorMessage(errorMessage);
        },
        (success) {
          // TODO : uncomment this in case it was wanted
          // _toastService.showSuccess(
          //   title: CommonStrings.codeSentTitle,
          // );
          startTimer();
        },
      );
    }
  }

  void onOtpCompleted(String otp) async {
    setBusy(true);
    try {
      switch (type) {
        case OtpSheetType.signin:
          await _handleLogin(otp);
          break;
        case OtpSheetType.signup:
          await _handleRegister(otp);
          break;
        case OtpSheetType.updatePhoneNumber:
          await _handleUpdatePhoneNumber(otp);
          break;
      }
    } finally {
      setBusy(false);
    }
  }

  Future<void> _handleLogin(String otp) async {
    final response = await _authService.login(phone: phoneNumber, otp: otp);
    await response.match(
      (error) async {
        _logger.e('Error logging in', error: error);
        setErrorMessage(error);
      },
      (authResponse) async {
        final setUserResult = await _authService.setAuthenticatedUser(
          authResponse,
        );
        await setUserResult.match(
          (error) async {
            _logger.e('Error setting authenticated user', error: error);
          },
          (_) async {
            final onboardingResult = await _onboardingService.setCurrentStep(
              OnboardingStep.completed,
            );
            await onboardingResult.match(
              (error) async {
                _logger.e('Error initializing onboarding flow', error: error);
              },
              (_) async {
                await _navigationService.clearStackAndShow(Routes.homeView);
              },
            );
          },
        );
      },
    );
  }

  Future<void> _handleRegister(String otp) async {
    final response = await _authService.register(
      phone: phoneNumber,
      otp: otp,
      firstName: firstName!,
      lastName: lastName!,
      userName: userName!,
      email: email!,
      gender: gender!,
      birthDate: birthDate!,
      address: address,
    );
    await response.match(
      (error) async {
        _logger.e('Error registering', error: error);
        setErrorMessage(error);
      },
      (authResponse) async {
        final setUserResult = await _authService.setAuthenticatedUser(
          authResponse,
        );
        await setUserResult.match(
          (error) async {
            _logger.e('Error setting authenticated user', error: error);
          },
          (_) async {
            final onboardingResult = await _onboardingService.setCurrentStep(
              OnboardingStep.vehicle,
            );
            await onboardingResult.match(
              (error) async {
                _logger.e('Error initializing onboarding flow', error: error);
              },
              (_) async {
                await _navigationService.navigateToSetUpVehiculeView();
              },
            );
          },
        );
      },
    );
  }

  //TODO: when i get to the profile section
  Future<void> _handleUpdatePhoneNumber(String otp) async {}

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
