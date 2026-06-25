import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:fpdart/fpdart.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:logger/web.dart';
import 'package:stacked/stacked.dart';

class LocationService with ListenableServiceMixin {
  LatLng? _currentLocation;
  LatLng? get currentLocation => _currentLocation;
  final Set<Polyline> _polylinesToPoint = <Polyline>{};
  Set<Polyline> get polylinesToPoint => _polylinesToPoint;

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

  /// Whether the location permission has already been granted (while-in-use
  /// or always). Used to decide if the prominent disclosure still needs to be
  /// shown before requesting the permission.
  Future<bool> isPermissionGranted() async {
    final permission = await Geolocator.checkPermission();
    return permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse;
  }

  Future<Either<String, Position>> getCurrentLocation() async {
    try {
      if (await Geolocator.checkPermission() == LocationPermission.denied) {
        await Geolocator.requestPermission();
      }
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
            distanceFilter: 2,
          ),
    );
  }

  listenToMyLocationReactive(LatLng? spotPosition) {
    listenToLocation().listen((event) async {
      _currentLocation = LatLng(event.latitude, event.longitude);
      if (spotPosition != null) {
        Logger().i("listening to user position and setting polylines ...");
        final result = await getRoutesPolylines(
          LatLng(event.latitude, event.longitude),
          spotPosition,
        );
        result.match((l) => null, (r) {
          _polylinesToPoint.clear();
          _polylinesToPoint.addAll(r.toSet());
        });
      }

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

  List<LatLng> _decodePolyline(String encoded) {
    List<LatLng> polyline = [];
    int index = 0, len = encoded.length;
    int lat = 0, lng = 0;

    while (index < len) {
      int b, shift = 0, result = 0;

      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1F) << shift;
        shift += 5;
      } while (b >= 0x20);

      int dlat = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
      lat += dlat;

      shift = 0;
      result = 0;

      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1F) << shift;
        shift += 5;
      } while (b >= 0x20);

      int dlng = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
      lng += dlng;

      polyline.add(LatLng(lat / 1E5, lng / 1E5));
    }

    return polyline;
  }

  Future<Either<String, List<Polyline>>> getRoutesPolylines(
    LatLng start,
    LatLng destination,
  ) async {
    try {
      final apiKey = dotenv.env["GOOGLE_MAPS_KEY"];

      final dio = Dio();

      final response = await dio.get(
        "https://maps.googleapis.com/maps/api/directions/json",
        queryParameters: {
          "origin": "${start.latitude},${start.longitude}",
          "destination": "${destination.latitude},${destination.longitude}",
          "alternatives": "true",
          "mode": "driving",
          "key": apiKey,
        },
      );

      if (response.statusCode != 200) {
        return Left("HTTP ERROR: ${response.statusCode}");
      }

      final data = response.data;

      if (data["status"] != "OK") {
        return Left("API ERROR: ${data["status"]}");
      }

      final routes = data["routes"] as List;
      List<Polyline> polylines = [];

      for (int i = 0; i < routes.length; i++) {
        final encoded = routes[i]["overview_polyline"]["points"];
        final decodedPoints = _decodePolyline(encoded);

        polylines.add(
          Polyline(
            polylineId: PolylineId("route_$i"),
            points: decodedPoints,
            width: 5,
            color: AppColors.greenKre, // blue polyline
          ),
        );
      }

      return Right(polylines);
    } catch (e) {
      return Left("Exception: $e");
    }
  }
}
