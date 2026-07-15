import 'dart:developer';

import 'package:dart_geohash/dart_geohash.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kreyno/app/app.bottomsheets.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/app/app.logger.dart';
import 'package:kreyno/app/app.router.dart';
import 'package:kreyno/app/app_constants.dart';
import 'package:kreyno/enums/gender.dart';
import 'package:kreyno/enums/reservation_status.dart';
import 'package:kreyno/models/car.dart';
import 'package:kreyno/models/parking_spot.dart';
import 'package:kreyno/models/user.dart';
import 'package:kreyno/services/google_map_service.dart';
import 'package:kreyno/services/location_service.dart';
import 'package:kreyno/services/parking_spots_service.dart';
import 'package:kreyno/services/reservations_service.dart';
import 'package:kreyno/services/toast_service.dart';
import 'package:kreyno/services/tracking_service.dart';
import 'package:kreyno/services/user_service.dart';
import 'package:kreyno/ui/views/my_let_place/my_let_place_view.dart';
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
  final _navigationService = locator<NavigationService>();

  final _parkingSpotService = locator<ParkingSpotsService>();

  /// Geohash precision used to bucket parking places into realtime zone
  /// channels. Must match the precision the backend uses for `parking.zone.*`.
  static const int _zonePrecision = 6;

  /// The center cell of the zone grid we are currently subscribed to. Tracked so
  /// we only re-subscribe when the user actually crosses into a different cell.
  String? _currentZoneCenter;

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
    _trackingService.removePlacesChangedListener(_onPlacesChanged);
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

  /// Subscribes to the realtime zone grid centered on ([lat], [lng]): the cell
  /// that contains the point plus its 8 neighbors (a 3×3 grid). Because a cell
  /// is a rectangle, watching only the center cell would miss places just across
  /// an edge, so we always watch the neighbors too. No-ops when we are already
  /// centered on the same cell.
  Future<void> _updateZoneSubscriptions(double lat, double lng) async {
    // GeoHash.fromDecimalDegrees takes (longitude, latitude).
    final center = GeoHash.fromDecimalDegrees(lng, lat, precision: _zonePrecision);
    if (center.geohash == _currentZoneCenter) return;
    _currentZoneCenter = center.geohash;
    // `neighbors` already includes the center cell (CENTRAL), giving all 9 cells.
    await _trackingService.listenToPlacesChange(center.neighbors.values.toSet());
  }

  Future<void> updateSelectedLocation(LatLng location) async {
    _selectedLocation = location;
    googleMapController.animateCamera(CameraUpdate.newLatLng(location));
    // A searched destination drives the view now: watch its zone grid so places
    // there appear/disappear in realtime.
    await _updateZoneSubscriptions(location.latitude, location.longitude);
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
    _selectedSpot = null;
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
              width: 28,
              height: 38,
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

    _loadingPlaces = false;
    rebuildUi();
  }

  void onLocationUpdate(LatLng newPosition) {
    // A searched destination takes precedence: while one is selected we keep the
    // view (and its zone subscriptions) locked to the destination, ignoring the
    // user's own movement.
    if (_selectedLocation == null) {
      final newCenter = GeoHash.fromDecimalDegrees(
        newPosition.longitude,
        newPosition.latitude,
        precision: _zonePrecision,
      ).geohash;
      // Only react when the user crosses into a different cell. Within the same
      // cell there is nothing new to fetch or re-subscribe.
      if (newCenter != _currentZoneCenter) {
        _updateZoneSubscriptions(newPosition.latitude, newPosition.longitude);
        getNearbyPlaces(
          lat: newPosition.latitude,
          lng: newPosition.longitude,
        );
      }
    }

    _lastPosition = newPosition;
  }

  void initHome() async {
    setBusy(true);
    await _userService.getProfile();

    // If the seller reopened the app while still having an active place, take
    // them straight back to it (on top of the map, so back returns here). Done
    // before the location guard so it happens even when location is disabled.
    await _resumeActiveParkingPlace();

    await _checkLocationService();
    if (!_isLocationServiceEnabled) {
      setBusy(false);
      return;
    }
    // TODO: check if user has a location permission first
    setBusy(false);

    // Subscribes to the zone grid for the user's current location (handled
    // inside goToCurrentLocation once the position is known).
    await goToCurrentLocation();

    _locationService.listenToMyLocationReactive(null);

    // _locationService.removeListener(_onLocationServiceUpdate);
    _locationService.addListener(_onLocationServiceUpdate);

    // Refresh nearby places whenever a grid-update event fires for the zone,
    // mirroring the manual refresh button.
    _trackingService.addPlacesChangedListener(_onPlacesChanged);

    // TEMPORARY: drive the same refresh every 10s to test place-change behavior
    // in the frontend. Uncomment to re-enable testing.
    // _trackingService.startPlacesChangeTest();
  }

  /// Checks the backend for the seller's latest active parking place and, if
  /// one exists, restores the screen matching its state on top of Home:
  ///  - no reservation → [MyLetPlaceView] waiting for a buyer;
  ///  - pending reservation → [MyLetPlaceView] with the accept/refuse card
  ///    (the reservation is seeded into [ReservationsService] since no
  ///    `reservation.new` socket event will be replayed);
  ///  - confirmed reservation → [MyLetPlaceView] with `ClientTrackingView`
  ///    pushed on top, mirroring the back-stack of the live accept flow.
  /// Silent when there is none or on error — Home stays the visible screen.
  Future<void> _resumeActiveParkingPlace() async {
    final result = await _parkingSpotService.getCurrentActiveParkingSpot();
    result.match(
      (error) => _logger.w('Could not resume active parking place: $error'),
      (active) {
        if (active == null) return;
        final reservation = active.reservation;
        final inProgress =
            reservation != null &&
            (reservation.status == ReservationStatus.pending ||
                reservation.status == ReservationStatus.confirmed);

        if (inProgress) {
          // Must be seeded before MyLetPlaceViewModel.initialise runs, which
          // keeps a seeded reservation for this spot instead of clearing it.
          locator<ReservationsService>().setReservation(reservation);
        }
        _navigationService.navigateToView(
          const MyLetPlaceView(),
          arguments: active.parkingPlace,
        );
        if (inProgress && reservation.status == ReservationStatus.confirmed) {
          _navigationService.navigateToClientTrackingView(
            parkingSpot: active.parkingPlace,
            reservation: reservation,
          );
        }
      },
    );
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
            zoom: 15,
          ),
        );
        // Recenter dismisses any searched destination, so realtime updates
        // should follow the user's current location again.
        await _updateZoneSubscriptions(location.latitude, location.longitude);
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
