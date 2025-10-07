import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/app/app.logger.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SetUpPermissionsViewModel extends BaseViewModel {
  final _logger = getLogger('SetUpPermissionsViewModel');
  final _navigationService = locator<NavigationService>();

  void goBack() {
    _navigationService.back();
  }

  void onSkipTapped() async {
    _logger.i('Skipping permissions, navigating to next step');
    // For now, just navigate back or to the next step
  }

  void onContinueTapped() async {
    // TODO: Implement permission granting logic
    _logger.i('Permissions granted, navigating to next step');
    // For now, just navigate back or to the next step
  }
}
