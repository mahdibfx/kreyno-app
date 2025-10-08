import 'package:app_settings/app_settings.dart';
import 'package:fpdart/fpdart.dart';
import 'package:kreyno/app/app.logger.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionsService {
  final _logger = getLogger('PermissionsService');

  // Location Permission Methods
  Future<Either<String, bool>> requestLocationPermission() async {
    try {
      _logger.i('Requesting location permission');
      final status = await Permission.locationWhenInUse.request();
      final isGranted = status.isGranted;
      _logger.i('Location permission request result: $status');
      return Right(isGranted);
    } catch (e) {
      _logger.e('Error requesting location permission: $e');
      return Left('Failed to request location permission: $e');
    }
  }

  Future<Either<String, bool>> isLocationGranted() async {
    try {
      final status = await Permission.locationWhenInUse.status;
      final isGranted = status.isGranted;
      _logger.i('Location permission status: $status');
      return Right(isGranted);
    } catch (e) {
      _logger.e('Error checking location permission: $e');
      return Left('Failed to check location permission: $e');
    }
  }

  // Notification Permission Methods
  Future<Either<String, bool>> requestNotificationPermission() async {
    try {
      _logger.i('Requesting notification permission');
      final status = await Permission.notification.request();
      final isGranted = status.isGranted;
      _logger.i('Notification permission request result: $status');
      return Right(isGranted);
    } catch (e) {
      _logger.e('Error requesting notification permission: $e');
      return Left('Failed to request notification permission: $e');
    }
  }

  Future<Either<String, bool>> isNotificationGranted() async {
    try {
      final status = await Permission.notification.status;
      final isGranted = status.isGranted;
      _logger.i('Notification permission status: $isGranted');
      return Right(isGranted);
    } catch (e) {
      _logger.e('Error checking notification permission: $e');
      return Left('Failed to check notification permission: $e');
    }
  }

  // Camera Permission Methods
  Future<Either<String, bool>> requestCameraPermission() async {
    try {
      _logger.i('Requesting camera permission');
      final status = await Permission.camera.request();
      final isGranted = status.isGranted;
      _logger.i('Camera permission request result: $isGranted');
      return Right(isGranted);
    } catch (e) {
      _logger.e('Error requesting camera permission: $e');
      return Left('Failed to request camera permission: $e');
    }
  }

  Future<Either<String, bool>> isCameraGranted() async {
    try {
      final status = await Permission.camera.status;
      final isGranted = status.isGranted;
      _logger.i('Camera permission status: $isGranted');
      return Right(isGranted);
    } catch (e) {
      _logger.e('Error checking camera permission: $e');
      return Left('Failed to check camera permission: $e');
    }
  }

  // Photos Permission Methods
  Future<Either<String, bool>> requestPhotosPermission() async {
    try {
      _logger.i('Requesting photos permission');
      final status = await Permission.photos.request();
      final isGranted = status.isGranted;
      _logger.i('Photos permission request result: $isGranted');
      return Right(isGranted);
    } catch (e) {
      _logger.e('Error requesting photos permission: $e');
      return Left('Failed to request photos permission: $e');
    }
  }

  Future<Either<String, bool>> isPhotosGranted() async {
    try {
      final status = await Permission.photos.status;
      final isGranted = status.isGranted;
      _logger.i('Photos permission status: $isGranted');
      return Right(isGranted);
    } catch (e) {
      _logger.e('Error checking photos permission: $e');
      return Left('Failed to check photos permission: $e');
    }
  }

  // Utility Methods
  Future<Either<String, bool>> openAppSettings() async {
    try {
      _logger.i('Opening app settings');
      await AppSettings.openAppSettings();
      _logger.i('App settings opened successfully');
      return const Right(true);
    } catch (e) {
      _logger.e('Error opening app settings: $e');
      return Left('Failed to open app settings: $e');
    }
  }

  Future<Either<String, bool>> isPermissionPermanentlyDenied(
    Permission permission,
  ) async {
    try {
      final status = await permission.status;
      final isPermanentlyDenied = status.isPermanentlyDenied;
      _logger.i(
        'Permission ${permission.toString()} permanently denied: $isPermanentlyDenied',
      );
      return Right(isPermanentlyDenied);
    } catch (e) {
      _logger.e('Error checking if permission is permanently denied: $e');
      return Left('Failed to check if permission is permanently denied: $e');
    }
  }
}
