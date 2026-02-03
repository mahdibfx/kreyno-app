import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/services/google_map_service.dart';
import 'package:kreyno/services/location_service.dart';
import 'package:kreyno/services/parking_spots_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ChooseSellingPlaceLocationViewModel extends BaseViewModel {
  final _googleMapsService = locator<GoogleMapService>();
  final _locationService = locator<LocationService>();
  final _navigationService = locator<NavigationService>();
  final _parkingSpotsService = locator<ParkingSpotsService>();

  Timer? debouncer;
  final searchFocusNode = FocusNode();
  String address = "Paris";
  LatLng center = const LatLng(48.8566, 2.3522); // Default to Paris
  void onMapCreated(GoogleMapController controller) {
    _googleMapsService.onMapCreated(controller);
  }

  useMyPosition() {
    _locationService.getCurrentLocation().then((positionResult) {
      positionResult.match((f) {}, (position) {
        center = LatLng(position.latitude, position.longitude);
        notifyListeners();
        _googleMapsService.animateToCameraPosition(
          CameraPosition(target: center, zoom: 14),
        );
      });
    });
  }

  Future<void> setAddress(LatLng lng) async {
    center = lng;
    final result = await _locationService.getPlaceFromCoordinates(lng);

    result.match((error) {}, (placeName) {
      address = placeName;
      notifyListeners();
    });
  }

  Future<void> onItemClicked(String address) async {
    searchFocusNode.unfocus();
    final position = await GeocodingPlatform.instance!.locationFromAddress(
      address,
    );
    _googleMapsService.animateToCameraPosition(
      CameraPosition(
        target: LatLng(position.first.latitude, position.first.longitude),
        zoom: 16,
      ),
    );
  }

  void chooseClicked() {
    final (String, LatLng) result = (address, center);
    _navigationService.back(result: result);
  }
}
