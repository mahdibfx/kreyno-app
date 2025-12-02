import 'package:dart_geohash/dart_geohash.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kreyno/app/app.bottomsheets.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/app/app.logger.dart';
import 'package:kreyno/app/app_constants.dart';
import 'package:kreyno/models/parking_spot.dart';
import 'package:kreyno/models/user.dart';
import 'package:kreyno/services/google_map_service.dart';
import 'package:kreyno/services/location_service.dart';
import 'package:kreyno/services/parking_spots_service.dart';
import 'package:kreyno/services/toast_service.dart';
import 'package:kreyno/services/tracking_service.dart';
import 'package:kreyno/services/user_service.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends ReactiveViewModel {
  final _logger = getLogger('HomeViewModel');
  final _bottomSheetService = locator<BottomSheetService>();
  final _userService = locator<UserService>();
  final _locationService = locator<LocationService>();
  final _trackingService = locator<TrackingService>();
  final _toastService = locator<ToastService>();
  final _googleMapService = locator<GoogleMapService>();
  final _parkingSpotService = locator<ParkingSpotsService>();
  ParkingSpot? _selectedSpot;

  ParkingSpot? get selectedSpot => _selectedSpot;
  User get currentUser => _userService.currentUser!;
  String get currentUserAvatarUrl =>
      currentUser.avatar?.url ?? AppConstants.defaultAvatarUrl;

  SelectedCar get selectedCar => _userService.currentUser!.selectedCar!;

  bool _isLocationServiceEnabled = false;
  bool get isLocationServiceEnabled => _isLocationServiceEnabled;
  bool _loadingPlaces = true;
  bool get loadingPlaces => _loadingPlaces;
  final List<Marker> _spotsMarkers = [];
  final List<ParkingSpot> _parkingSpots = [];

  List<Marker> get spotsMarkers => _spotsMarkers;
  List<ParkingSpot> get parkingSpots => _parkingSpots;

  CameraPosition get initialCameraPosition =>
      GoogleMapService.initialCameraPosition;

  LatLng? _lastPosition;

  String get distanceToSelectedSpot {
    if (_lastPosition == null || _selectedSpot == null) return "0 km";
    final distanceInMeters = Geolocator.distanceBetween(
      _lastPosition!.latitude,
      _lastPosition!.longitude,
      _selectedSpot!.latitude,
      _selectedSpot!.longitude,
    );
    return "${(distanceInMeters / 1000).toStringAsFixed(1)} km";
  }

  String get timeToSelectedSpot {
    if (_lastPosition == null || _selectedSpot == null) return "0 min";
    final distanceInMeters = Geolocator.distanceBetween(
      _lastPosition!.latitude,
      _lastPosition!.longitude,
      _selectedSpot!.latitude,
      _selectedSpot!.longitude,
    );
    // Assuming average speed of 30 km/h = 8.33 m/s
    final timeInSeconds = distanceInMeters / 8.33;
    final timeInMinutes = (timeInSeconds / 60).ceil();
    return "$timeInMinutes min";
  }

  Future<void> openFilterBottomSheet() async {
    final result = await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.homeFilter,
    );
  }

  void onMapCreated(GoogleMapController controller) {
    _googleMapService.onMapCreated(controller);
  }

  void _animateToCameraPosition(CameraPosition cameraPosition) {
    _googleMapService.animateToCameraPosition(cameraPosition);
  }

  void setIsLocationServiceEnabled(bool value) {
    _isLocationServiceEnabled = value;
    rebuildUi();
  }

  Future<void> getNearbyPlaces() async {
    Logger().i(
      "Getting nearby places ..  ${_locationService.currentLocation?.latitude ?? 0}, ${_locationService.currentLocation?.longitude ?? 0}",
    );
    _loadingPlaces = true;
    rebuildUi();
    _spotsMarkers.clear();
    _parkingSpots.clear();
    rebuildUi();
    final result = await _parkingSpotService.getNearbyParkingSpots(
      _locationService.currentLocation?.latitude ?? 0,
      _locationService.currentLocation?.longitude ?? 0,
      10,
    );
    result.match(
      (errorMessage) {
        _toastService.showError(title: errorMessage);
      },
      (parkingSpots) {
        _parkingSpots.addAll(parkingSpots);

        rebuildUi();

        var spotsMarkers = parkingSpots.map((spot) {
          return Marker(
            markerId: MarkerId(spot.id.toString()),
            position: LatLng(spot.latitude, spot.longitude),

            icon: AssetMapBitmap(
              spot.electricChargeStation
                  ? "assets/images/electric_place_pin.png"
                  : "assets/images/normal_parking_pin.png",
              width: 42,
              height: 55,
            ),

            onTap: () {
              _selectedSpot = spot;
              rebuildUi();
            },
          );
        }).toList();
        _spotsMarkers.addAll(spotsMarkers);
        rebuildUi();
      },
    );
    final hash = GeoHash.fromDecimalDegrees(
      _locationService.currentLocation?.longitude ?? 0,
      _locationService.currentLocation?.latitude ?? 0,
    );

    _trackingService.listenToPlacesChange(
      parkingSpots.isEmpty ? hash.geohash : parkingSpots.first.geoHash,
    );
    _loadingPlaces = false;
    rebuildUi();
  }

  final double _targetDistance = 1000;

  void onLocationUpdate(LatLng newPosition) {
    if (_lastPosition != null) {
      double distance = Geolocator.distanceBetween(
        _lastPosition!.latitude,
        _lastPosition!.longitude,
        newPosition.latitude,
        newPosition.longitude,
      );

      // Add to total
      if (distance > _targetDistance) {
        getNearbyPlaces();
        distance = 0;
      }

      // Update last position
      _lastPosition = newPosition;
    }
  }

  void initHome() async {
    await _checkLocationService();
    if (!_isLocationServiceEnabled) return;
    // TODO: check if user has a location permission first
    await goToCurrentLocation();
    int fireIdStored = _trackingService.fireId;
    await getNearbyPlaces();
    _locationService.listenToMyLocationReactive();
    _locationService.addListener(() {
      onLocationUpdate(_locationService.currentLocation!);
    });
    _trackingService.addListener(() {
      if (fireIdStored != _trackingService.fireId) {
        getNearbyPlaces();
        fireIdStored = _trackingService.fireId;
      }
    });
  }

  Future<void> goToCurrentLocation() async {
    final result = await _locationService.getCurrentLocation();
    await result.match(
      (error) async {
        _logger.e('Failed to get current location: $error');
      },
      (location) async {
        _lastPosition = LatLng(location.latitude, location.longitude);
        _animateToCameraPosition(
          CameraPosition(
            target: LatLng(location.latitude, location.longitude),
            zoom: 10,
          ),
        );
      },
    );
  }

  void onLocationServiceDisabledTapped() async {
    final result = await _locationService.openLocationSettings();
    await result.match(
      (error) async {
        _logger.e('Failed to open location settings: $error');
        _toastService.showError(
          title: 'Failed to open location settings',
          description: error,
        );
      },
      (isOpened) async {
        setIsLocationServiceEnabled(isOpened);
      },
    );
  }

  Future<void> _checkLocationService() async {
    final result = await _locationService.isLocationServiceEnabled();
    await result.match(
      (error) async {
        _logger.e('Failed to check location service: $error');
      },
      (isEnabled) async {
        setIsLocationServiceEnabled(isEnabled);
      },
    );
  }

  void updateSelectedCar(SelectedCar car) {
    _userService.setUserData(currentUser.copyWith(selectedCar: car));
  }

  void openCreationSpotSheet() {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.createSpot,
      isScrollControlled: true,
    );
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [
    _userService,
    _trackingService,
    _locationService,
  ];
}
