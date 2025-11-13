import 'dart:async';

import 'package:fpdart/fpdart.dart';
import 'package:geolocator/geolocator.dart';

class LocationService {
  Future<Either<String, Position>> getCurrentLocation() async {
    try {
      final position = await Geolocator.getCurrentPosition();
      return Right(position);
    } catch (e) {
      return Left(e.toString());
    }
  }

  Stream<Position> listenToLocation({LocationSettings? locationSettings}) {
    return Geolocator.getPositionStream(
      locationSettings:
          locationSettings ??
          const LocationSettings(
            accuracy: LocationAccuracy.high,
            distanceFilter: 10,
          ),
    );
  }

  Future<Either<String, bool>> isLocationServiceEnabled() async {
    try {
      final isEnabled = await Geolocator.isLocationServiceEnabled();
      return Right(isEnabled);
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, bool>> openLocationSettings() async {
    try {
      await Geolocator.openLocationSettings();
      return const Right(true);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
