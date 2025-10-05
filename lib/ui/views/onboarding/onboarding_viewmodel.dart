import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/app/app.logger.dart';
import 'package:kreyno/app/app.router.dart';
import 'package:kreyno/enums/onboarding_step.dart';
import 'package:kreyno/services/onboarding_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class OnboardingViewModel extends BaseViewModel {
  final _logger = getLogger('OnboardingViewModel');
  final _navigationService = locator<NavigationService>();
  final _onboardingService = locator<OnboardingService>();

  void goToSignIn() async {
    final result = await _onboardingService.setCurrentStep(
      OnboardingStep.authentication,
    );

    await result.match(
      (error) async => _logger.e('Error setting onboarding step', error: error),
      (_) async => await _navigationService.navigateToSigninView(),
    );
  }
}
