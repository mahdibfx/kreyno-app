import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/app/app.logger.dart';
import 'package:kreyno/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SetUpPermissionsViewModel extends BaseViewModel {
  final _logger = getLogger('SetUpPermissionsViewModel');
  final _navigationService = locator<NavigationService>();

  bool _isNotificationGranted = false;
  bool get isNotificationGranted => _isNotificationGranted;

  bool _isLocationGranted = false;
  bool get isLocationGranted => _isLocationGranted;

  bool get allPermissionsGranted => isLocationGranted && isNotificationGranted;

  void onLocationAuthorizeTapped() async {
    _isLocationGranted = true;
    rebuildUi();
  }

  void onNotificationAuthorizeTapped() async {
    _isNotificationGranted = true;
    rebuildUi();
  }

  void goBack() {
    _navigationService.back();
  }

  void onSkipTapped() async {
    _navigateToHomeView();
  }

  void onContinueTapped() async {
    _navigateToHomeView();
  }

  void _navigateToHomeView() async {
    await _navigationService.clearStackAndShow(Routes.homeView);
  }
}
