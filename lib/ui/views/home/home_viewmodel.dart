import 'dart:developer';

import 'package:dart_geohash/dart_geohash.dart';
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

  double radius = 2.5;
  bool? _possibleElectric;
  bool loadingCurrentLocation = false;
  ParkingSpot? _selectedSpot;
  late GoogleMapController googleMapController;

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

  LatLng? _selectedLocation;
  LatLng? get selectedLocation => _selectedLocation;
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

  @override
  void dispose() {
    _locationService.removeListener(_onLocationServiceUpdate);
    _trackingService.removeListener(_onTrackingServiceUpdate);
    super.dispose();
  }

  Future<void> openFilterBottomSheet() async {
    final result = await _bottomSheetService.showCustomSheet(
      isScrollControlled: true,
      variant: BottomSheetType.homeFilter,
      data: [_possibleElectric, radius],
    );

    if (result != null && result.confirmed) {
      _possibleElectric = result.data[0];
      radius = result.data[1];
      getNearbyPlaces();
    }
  }

  void onMapCreated(GoogleMapController controller) {
    setBusy(true);
    googleMapController = controller;
    _googleMapService.onMapCreated(controller);
    setBusy(false);
  }

  void _animateToCameraPosition(CameraPosition cameraPosition) {
    googleMapController.animateCamera(
      CameraUpdate.newCameraPosition(cameraPosition),
    );
  }

  void setIsLocationServiceEnabled(bool value) {
    _isLocationServiceEnabled = value;
    rebuildUi();
  }

  Future<void> updateSelectedLocation(LatLng location) async {
    _selectedLocation = location;
    googleMapController.animateCamera(CameraUpdate.newLatLng(location));
    await getNearbyPlaces();

    _spotsMarkers.removeWhere(
      (marker) => marker.markerId.value == "selected_location",
    );
    _spotsMarkers.add(
      Marker(
        markerId: const MarkerId("selected_location"),
        position: location,
        onTap: () {
          return;
        },
        icon: AssetMapBitmap("assets/images/searched_address.png", height: 55),

        //  AssetMapBitmap(
        //   "assets/images/searched_address.png",
        //   width: 42,
        //   height: 55,
        // ),
      ),
    );
    notifyListeners();
    // return;
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
      radius,
      _possibleElectric == true
          ? 1
          : _possibleElectric == null
          ? null
          : 0,
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
      precision: 10,
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
    setBusy(true);
    await _userService.getProfile();
    await _checkLocationService();
    if (!_isLocationServiceEnabled) {
      setBusy(false);
      return;
    }
    // TODO: check if user has a location permission first
    setBusy(false);

    await goToCurrentLocation();
    await getNearbyPlaces();

    _locationService.listenToMyLocationReactive(null);

    // _locationService.removeListener(_onLocationServiceUpdate);
    _locationService.addListener(_onLocationServiceUpdate);

    // _trackingService.removeListener(_onTrackingServiceUpdate);
    // _trackingService.addListener(_onTrackingServiceUpdate);
  }

  void _onLocationServiceUpdate() {
    if (_locationService.currentLocation != null) {
      onLocationUpdate(_locationService.currentLocation!);
    }
  }

  int _fireIdStored = 0;
  void _onTrackingServiceUpdate() {
    if (_fireIdStored != _trackingService.fireId) {
      getNearbyPlaces();
      _fireIdStored = _trackingService.fireId;
    }
  }

  Future<void> goToCurrentLocation() async {
    loadingCurrentLocation = true;
    _selectedLocation = null;
    notifyListeners();
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
            zoom: 12,
          ),
        );
      },
    );
    loadingCurrentLocation = false;
    notifyListeners();
    if (_selectedLocation != null) {
      _selectedLocation = null;

      getNearbyPlaces();
    }
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
