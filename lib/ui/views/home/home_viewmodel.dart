import 'dart:developer';

import 'package:dart_geohash/dart_geohash.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kreyno/app/app.bottomsheets.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/app/app.logger.dart';
import 'package:kreyno/app/app_constants.dart';
import 'package:kreyno/enums/gender.dart';
import 'package:kreyno/models/car.dart';
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
  final _userService = locator<UserService>();

  final _logger = getLogger('HomeViewModel');
  final _bottomSheetService = locator<BottomSheetService>();
  final _locationService = locator<LocationService>();
  final _trackingService = locator<TrackingService>();
  final _toastService = locator<ToastService>();
  final _googleMapService = locator<GoogleMapService>();

  final _parkingSpotService = locator<ParkingSpotsService>();

  double radius = 0.5;
  bool? _possibleElectric;
  bool loadingCurrentLocation = false;
  ParkingSpot? _selectedSpot;
  late GoogleMapController googleMapController;

  ParkingSpot? get selectedSpot => _selectedSpot;

  /// Closes the selected-spot card (e.g. when tapping the map outside it).
  void clearSelectedSpot() {
    if (_selectedSpot == null) return;
    _selectedSpot = null;
    rebuildUi();
  }

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
    _trackingService.onPlacesChanged = null;
    // _trackingService.stopPlacesChangeTest();
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
    await getNearbyPlaces(lat: location.latitude, lng: location.longitude);
    notifyListeners();
  }

  void _addSelectedLocationMarker(LatLng location) {
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
      ),
    );
  }

  Future<void> getNearbyPlaces({double? lat, double? lng}) async {
    final queryLat =
        lat ??
        _selectedLocation?.latitude ??
        _locationService.currentLocation?.latitude ??
        0;
    final queryLng =
        lng ??
        _selectedLocation?.longitude ??
        _locationService.currentLocation?.longitude ??
        0;
    Logger().i("Getting nearby places ..  $queryLat, $queryLng");
    _loadingPlaces = true;
    rebuildUi();
    _spotsMarkers.clear();
    _parkingSpots.clear();
    rebuildUi();
    final result = await _parkingSpotService.getNearbyParkingSpots(
      queryLat,
      queryLng,
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
    if (_selectedLocation != null) {
      _addSelectedLocationMarker(_selectedLocation!);
      rebuildUi();
    }
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

    _locationService.listenToMyLocationReactive(null);

    // _locationService.removeListener(_onLocationServiceUpdate);
    _locationService.addListener(_onLocationServiceUpdate);

    // Refresh nearby places whenever a grid-update event fires for the zone,
    // mirroring the manual refresh button.
    _trackingService.onPlacesChanged = _onPlacesChanged;

    // TEMPORARY: drive the same refresh every 10s to test place-change behavior
    // in the frontend. Uncomment to re-enable testing.
    // _trackingService.startPlacesChangeTest();
  }

  void _onPlacesChanged() {
    getNearbyPlaces();
  }

  void _onLocationServiceUpdate() {
    if (_locationService.currentLocation != null) {
      onLocationUpdate(_locationService.currentLocation!);
    }
  }


  /// Shows the prominent location disclosure (Google Play requirement) before
  /// the runtime permission prompt. Returns true if the app may proceed to
  /// request location. If the permission is already granted, no disclosure is
  /// shown. Returns false when the user declines.
  Future<bool> _ensureLocationDisclosureAccepted() async {
    if (await _locationService.isPermissionGranted()) {
      return true;
    }
    final response = await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.locationDisclosure,
      isScrollControlled: true,
      barrierDismissible: false,
    );
    return response?.confirmed == true;
  }

  Future<void> goToCurrentLocation() async {
    // Prominent disclosure must be shown and accepted before we request the
    // location permission below (Google Play policy).
    final disclosureAccepted = await _ensureLocationDisclosureAccepted();
    if (!disclosureAccepted) {
      return;
    }
    loadingCurrentLocation = true;
    _selectedLocation = null;
    notifyListeners();
    //TODO:AI CLAUDE THIS LINE UNDER THIS TODO IS RESPONSIPLE FOR REQUESTING LOCATION PERMISSIONS
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
        await getNearbyPlaces();
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
