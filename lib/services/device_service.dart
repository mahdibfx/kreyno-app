import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/app/app.logger.dart';
import 'package:kreyno/app/app_constants.dart';
import 'package:kreyno/services/shared_prefs_service.dart';
import 'package:uuid/uuid.dart';

class DeviceService {
  final _logger = getLogger('DeviceService');
  final _sharedPrefsService = locator<SharedPrefsService>();

  Future<Either<String, String>> getDeviceId() async {
    // Try to get existing device ID
    final readResult = await _sharedPrefsService.readData(
      AppConstants.deviceIdKey,
    );

    return readResult.fold((error) => Left('Failed to get device ID: $error'), (
      deviceId,
    ) async {
      if (deviceId == null || deviceId.isEmpty) {
        // Generate new UUID v4 (random), prefixed with the platform so the
        // admin dashboard can split iOS/Android. The backend only ever uses
        // this value as the Sanctum token name and never looks a token up by
        // it, so the prefix is inert everywhere else.
        final newDeviceId = '${Platform.isIOS ? 'ios' : 'android'}:${const Uuid().v4()}';
        final writeResult = await _sharedPrefsService.writeData(
          AppConstants.deviceIdKey,
          newDeviceId,
        );

        return writeResult.fold(
          (error) => Left('Failed to save device ID: $error'),
          (_) {
            _logger.i(
              'Generated new device ID: ${newDeviceId.substring(0, 8)}...',
            );
            return Right(newDeviceId);
          },
        );
      } else {
        _logger.i(
          'Retrieved existing device ID: ${deviceId.substring(0, 8)}...',
        );
        return Right(deviceId);
      }
    });
  }

  Future<Either<String, Unit>> clearDeviceId() async {
    final result = await _sharedPrefsService.deleteData(
      AppConstants.deviceIdKey,
    );

    return result.fold((error) => Left('Failed to clear device ID: $error'), (
      _,
    ) {
      _logger.i('Device ID cleared');
      return const Right(unit);
    });
  }
}
