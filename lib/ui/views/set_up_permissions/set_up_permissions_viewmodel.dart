import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/app/app.logger.dart';
import 'package:kreyno/app/app.router.dart';
import 'package:kreyno/services/permissions_service.dart';
import 'package:kreyno/services/toast_service.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SetUpPermissionsViewModel extends BaseViewModel {
  final _logger = getLogger('SetUpPermissionsViewModel');
  final _navigationService = locator<NavigationService>();
  final _permissionsService = locator<PermissionsService>();
  final _toastService = locator<ToastService>();

  bool _isNotificationGranted = false;
  bool get isNotificationGranted => _isNotificationGranted;

  bool _isLocationGranted = false;
  bool get isLocationGranted => _isLocationGranted;

  bool get allPermissionsGranted => isLocationGranted && isNotificationGranted;

  Future<void> initializePermissions() async {
    // Check location permission status
    final locationResult = await _permissionsService.isLocationGranted();
    await locationResult.match(
      (error) async {
        _logger.e('Failed to check location permission: $error');
      },
      (isGranted) async {
        setLocationGranted(isGranted);
      },
    );

    // Check notification permission status
    final notificationResult = await _permissionsService
        .isNotificationGranted();
    await notificationResult.match(
      (error) async {
        _logger.e('Failed to check notification permission: $error');
      },
      (isGranted) async {
        setNotificationGranted(isGranted);
      },
    );
  }

  void setLocationGranted(bool granted) {
    if (granted == _isLocationGranted) return;
    _isLocationGranted = granted;
    rebuildUi();
  }

  void setNotificationGranted(bool granted) {
    if (granted == _isNotificationGranted) return;
    _isNotificationGranted = granted;
    rebuildUi();
  }

  void onLocationAuthorizeTapped() async {
    _requestLocationPermission();
  }

  void onNotificationAuthorizeTapped() async {
    _requestNotificationPermission();
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

  void _requestLocationPermission() async {
    setBusy(true);
    try {
      final result = await _permissionsService.requestLocationPermission();
      await result.match(
        (error) async {
          _logger.e('Location permission request failed: $error');
          _toastService.showError(
            title: 'Permission Error',
            description: error,
          );
        },
        (isGranted) async {
          setLocationGranted(isGranted);
          if (isGranted) {
            _logger.i('Location permission granted');
          } else {
            _logger.i('Location permission denied');
            // Check if permission is permanently denied
            final permanentDenialResult = await _permissionsService
                .isPermissionPermanentlyDenied(Permission.locationWhenInUse);
            await permanentDenialResult.match(
              (error) async {
                _logger.e(
                  'Failed to check if location permission is permanently denied: $error',
                );
              },
              (isPermanentlyDenied) async {
                if (isPermanentlyDenied) {
                  _logger.i(
                    'Location permission is permanently denied, opening app settings',
                  );
                  _openAppSettings();
                }
              },
            );
          }
        },
      );
    } finally {
      setBusy(false);
    }
  }

  // Utility method for opening app settings (for future use when permissions are permanently denied)
  void _openAppSettings() async {
    final result = await _permissionsService.openAppSettings();
    await result.match(
      (error) async {
        _logger.e('Failed to open app settings: $error');
        _toastService.showError(title: 'Settings Error', description: error);
      },
      (opened) async {
        if (opened) {
          _logger.i('App settings opened successfully');
          // TODO: Check if permissions are granted after opening app settings
          // await initializePermissions();
        }
      },
    );
  }

  void _requestNotificationPermission() async {
    setBusy(true);
    try {
      final result = await _permissionsService.requestNotificationPermission();
      await result.match(
        (error) async {
          _logger.e('Notification permission request failed: $error');
          _toastService.showError(
            title: 'Permission Error',
            description: error,
          );
        },
        (isGranted) async {
          setNotificationGranted(isGranted);
          if (isGranted) {
            _logger.i('Notification permission granted');
          } else {
            _logger.i('Notification permission denied');
            // Check if permission is permanently denied
            final permanentDenialResult = await _permissionsService
                .isPermissionPermanentlyDenied(Permission.notification);
            await permanentDenialResult.match(
              (error) async {
                _logger.e(
                  'Failed to check if notification permission is permanently denied: $error',
                );
              },
              (isPermanentlyDenied) async {
                if (isPermanentlyDenied) {
                  _logger.i(
                    'Notification permission is permanently denied, opening app settings',
                  );
                  _openAppSettings();
                }
              },
            );
          }
        },
      );
    } finally {
      setBusy(false);
    }
  }
}
