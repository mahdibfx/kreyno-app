import 'package:fpdart/fpdart.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/app/app.logger.dart';
import 'package:kreyno/app/app_constants.dart';
import 'package:kreyno/enums/onboarding_step.dart';
import 'package:kreyno/services/shared_prefs_service.dart';

class OnboardingService {
  final _logger = getLogger('OnboardingService');
  final _sharedPrefsService = locator<SharedPrefsService>();

  Future<Either<String, OnboardingStep?>> getCurrentStep() async {
    final result = await _sharedPrefsService.readData(
      AppConstants.currentStepKey,
    );

    return result.fold(
      (error) => Left('Failed to get onboarding step: $error'),
      (stepName) {
        if (stepName == null || stepName.isEmpty) {
          return const Right(null);
        }

        try {
          final step = OnboardingStep.values.firstWhere(
            (s) => s.name == stepName,
          );
          _logger.i('Retrieved onboarding step: $step');
          return Right(step);
        } catch (e) {
          _logger.e('Invalid onboarding step: $stepName');
          return const Right(null);
        }
      },
    );
  }

  Future<Either<String, Unit>> setCurrentStep(OnboardingStep step) async {
    final result = await _sharedPrefsService.writeData(
      AppConstants.currentStepKey,
      step.name,
    );

    return result.fold(
      (error) => Left('Failed to save onboarding step: $error'),
      (_) {
        _logger.i('Saved onboarding step: $step');
        return const Right(unit);
      },
    );
  }

  Future<Either<String, Unit>> completeOnboarding() async {
    final result = await _sharedPrefsService.deleteData(
      AppConstants.currentStepKey,
    );

    return result.fold(
      (error) => Left('Failed to clear onboarding step: $error'),
      (_) {
        _logger.i('Onboarding completed');
        return const Right(unit);
      },
    );
  }

  Future<Either<String, bool>> isInOnboarding() async {
    final stepResult = await getCurrentStep();

    return stepResult.fold(
      (error) => Left(error),
      (step) => Right(step != null),
    );
  }
}
