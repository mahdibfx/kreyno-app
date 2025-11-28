import 'dart:async';

import 'package:fpdart/fpdart.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:stacked/stacked.dart';

class LocationService with ListenableServiceMixin {
  LatLng? _currentLocation;
  LatLng? get currentLocation => _currentLocation;

  LocationService() {
    listenToReactiveValues([_currentLocation]);
  }

  Future<Either<String, String>> getPlaceFromCoordinates(
    LatLng position,
  ) async {
    try {
      final place = await GeocodingPlatform.instance!.placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );
      final formatted =
          " ${place.first.locality}, ${place.first.street}, ${place.first.postalCode}";
      return Right(formatted);
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, Position>> getCurrentLocation() async {
    try {
      final position = await Geolocator.getCurrentPosition();
      _currentLocation = LatLng(position.latitude, position.longitude);
      notifyListeners();
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

  listenToMyLocationReactive() {
    listenToLocation().listen((event) {
      _currentLocation = LatLng(event.latitude, event.longitude);
      notifyListeners();
    });
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
