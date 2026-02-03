import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:fpdart/fpdart.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:kreyno/services/user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/app/app.logger.dart';
import 'package:kreyno/app/app.router.dart';
import 'package:kreyno/services/auth_service.dart';
import 'package:kreyno/services/picked_language_service.dart';
import 'package:kreyno/services/onboarding_service.dart';
import 'package:kreyno/enums/onboarding_step.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final _logger = getLogger('StartupViewModel');
  final _navigationService = locator<NavigationService>();
  final _authService = locator<AuthService>();
  final _pickedLanguageService = locator<PickedLanguageService>();
  final _onboardingService = locator<OnboardingService>();
  final _userService = locator<UserService>();

  Future runStartupLogic() async {
    await AppTrackingTransparency.requestTrackingAuthorization();

    if (!await InternetConnectionChecker.instance.hasConnection) {
      await _navigationService.replaceWithErrorView();
      return;
    }

    if (!await _checkLanguageSelection()) {
      await _navigationService.replaceWithSetUpLanguageView();
      return;
    }

    final (isAuthenticated, currentStepResult) = await _getAppState();

    if (isAuthenticated) {
      await _prefetchUserProfile();
    }

    await _navigateBasedOnState(isAuthenticated, currentStepResult);
  }

  Future<(bool, Either<String, OnboardingStep?>)> _getAppState() async {
    final results = await Future.wait([
      _authService.getAccessToken(),
      _onboardingService.getCurrentStep(),
    ]);

    final accessToken = results[0] as String?;
    final currentStepResult = results[1] as Either<String, OnboardingStep?>;
    final isAuthenticated = accessToken != null && accessToken.isNotEmpty;

    return (isAuthenticated, currentStepResult);
  }

  Future<bool> _checkLanguageSelection() async {
    final languageResult = await _pickedLanguageService.isLanguageSelected();

    return languageResult.fold(
      (error) {
        _logger.w('Error checking language selection: $error');
        return false;
      },
      (isSelected) {
        _logger.i('Language selection status: $isSelected');
        return isSelected;
      },
    );
  }

  Future<void> _navigateBasedOnState(
    bool isAuthenticated,
    Either<String, OnboardingStep?> currentStepResult,
  ) async {
    await currentStepResult.match(
      (error) async {
        _logger.w('Error reading onboarding state: $error');
        await _navigationService.replaceWithOnboardingView();
      },
      (currentStep) async {
        if (currentStep == null) {
          await _navigationService.replaceWithOnboardingView();
        } else {
          await _resumeOnboarding(currentStep, isAuthenticated);
        }
      },
    );
  }

  Future<void> _handleAuthenticationStep(bool isAuthenticated) async {
    if (isAuthenticated) {
      _logger.i('User authenticated, navigating to home');
      await _navigationService.replaceWithHomeView();
    } else {
      _logger.i('User not authenticated, navigating to sign in');
      await _navigationService.replaceWithSigninView();
    }
  }

  Future<void> _handleVehicleStep(bool isAuthenticated) async {
    if (isAuthenticated) {
      _logger.i('User authenticated, navigating to set up vehicle');
      await _navigationService.replaceWithSetUpVehiculeView();
    } else {
      _logger.i('User not authenticated, navigating to sign in');
      await _navigationService.replaceWithSigninView();
    }
  }

  Future<void> _prefetchUserProfile() async {
    final profileResult = await _userService.getProfile();
    profileResult.match(
      (error) => _logger.e('Error prefetching profile: $error'),
      (_) => _logger.i('Profile prefetched successfully'),
    );
  }

  Future<void> _resumeOnboarding(
    OnboardingStep step,
    bool isAuthenticated,
  ) async {
    _logger.i('Resuming onboarding from step: $step');

    switch (step) {
      case OnboardingStep.authentication:
        await _handleAuthenticationStep(isAuthenticated);
        break;
      case OnboardingStep.vehicle:
        await _handleVehicleStep(isAuthenticated);
        break;
      case OnboardingStep.completed:
        await _navigationService.replaceWithHomeView();
        break;
    }
  }
}
