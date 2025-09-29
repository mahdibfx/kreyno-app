import 'package:stacked/stacked.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/app/app.router.dart';
import 'package:kreyno/services/auth_service.dart';
import 'package:kreyno/services/picked_language_service.dart';
import 'package:kreyno/services/onboarding_service.dart';
import 'package:kreyno/enums/onboarding_step.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _authService = locator<AuthService>();
  final _pickedLanguageService = locator<PickedLanguageService>();
  final _onboardingService = locator<OnboardingService>();

  Future runStartupLogic() async {
    await Future.delayed(const Duration(seconds: 3));

    // Check if language has been selected using our service
    final languageResult = await _pickedLanguageService.isLanguageSelected();

    final isLanguagePicked = languageResult.fold((error) {
      // If there's an error reading language preference, assume not picked
      return false;
    }, (isSelected) => isSelected);

    if (!isLanguagePicked) {
      await _navigationService.replaceWithSetUpLanguageView();
      return;
    }

    // Check if user is authenticated (has access token)
    final accessToken = await _authService.getAccessToken();
    final isAuthenticated = accessToken != null && accessToken.isNotEmpty;

    if (isAuthenticated) {
      // User is logged in, check onboarding state
      final currentStepResult = await _onboardingService.getCurrentStep();

      currentStepResult.match(
        (error) async {
          // Error reading onboarding state, assume complete and go to home
          await _navigationService.replaceWithHomeView();
        },
        (currentStep) async {
          if (currentStep == null) {
            // No onboarding step saved, user completed onboarding
            await _navigationService.replaceWithHomeView();
          } else {
            // Resume onboarding from where user left off
            await _resumeOnboarding(currentStep);
          }
        },
      );
    } else {
      // User is not logged in, navigate to onboarding
      await _navigationService.replaceWithOnboardingView();
    }
  }

  Future<void> _resumeOnboarding(OnboardingStep step) async {
    if (step == OnboardingStep.vehicle) {
      // TODO: do necessary logic to resume setup vehicule
      await _navigationService.replaceWithSetUpVehiculeView();
      return;
    }
    if (step == OnboardingStep.paymentMethods) {
      // TODO: do necessary logic to resume setup payment methods
      await _navigationService.replaceWithSetUpPaymentMethodsView();
      return;
    }
    if (step == OnboardingStep.permissions) {
      // TODO: do necessary logic to resume setup permissions
      await _navigationService.replaceWithSetUpPermissionsView();
      return;
    }
    if (step == OnboardingStep.completed) {
      await _navigationService.replaceWithHomeView();
      return;
    }
  }
}
