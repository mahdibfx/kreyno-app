import 'package:fpdart/fpdart.dart';
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

  Future runStartupLogic() async {
    // Show splash screen for minimum duration
    await Future.delayed(const Duration(seconds: 3));

    final isLanguageSelected = await _checkLanguageSelection();
    if (!isLanguageSelected) {
      await _navigationService.replaceWithSetUpLanguageView();
      return;
    }

    final results = await Future.wait([
      _authService.getAccessToken(),
      _onboardingService.getCurrentStep(),
    ]);

    final accessToken = results[0] as String?;
    final currentStepResult = results[1] as Either<String, OnboardingStep?>;

    final isAuthenticated = accessToken != null && accessToken.isNotEmpty;

    await _navigateBasedOnState(isAuthenticated, currentStepResult);
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
        if (isAuthenticated) {
          await _navigationService.replaceWithHomeView();
        } else {
          await _navigationService.replaceWithOnboardingView();
        }
      },
      (currentStep) async {
        if (currentStep == null) {
          if (isAuthenticated) {
            await _navigationService.replaceWithHomeView();
          } else {
            await _navigationService.replaceWithOnboardingView();
          }
        } else {
          await _resumeOnboarding(currentStep);
        }
      },
    );
  }

  Future<void> _resumeOnboarding(OnboardingStep step) async {
    _logger.i('Resuming onboarding from step: $step');

    switch (step) {
      case OnboardingStep.authentication:
        await _navigationService.replaceWithSigninView();
        break;
      case OnboardingStep.vehicle:
        await _navigationService.replaceWithSetUpVehiculeView();
        break;
      case OnboardingStep.completed:
        await _navigationService.replaceWithHomeView();
        break;
    }
  }
}
