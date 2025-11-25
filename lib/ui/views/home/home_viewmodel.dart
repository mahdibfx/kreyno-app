import 'package:flutter/material.dart';
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
import 'package:kreyno/services/user_service.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends ReactiveViewModel {
  final _logger = getLogger('HomeViewModel');
  final _bottomSheetService = locator<BottomSheetService>();
  final _userService = locator<UserService>();
  final _locationService = locator<LocationService>();
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
  final List<ParkingSpot> _parkingSpots = [
    // const ParkingSpot(
    //   id: 1,
    //   address: "address",
    //   longitude: 48.8322,
    //   latitude: 2.8433,
    //   geoHash: "geoHash",
    //   price: 300,
    //   totalPaidPrice: 312,
    //   electricChargeStation: true,
    //   reserved: false,
    // ),
  ];

  List<Marker> get spotsMarkers => _spotsMarkers;
  List<ParkingSpot> get parkingSpots => _parkingSpots;

  CameraPosition get initialCameraPosition =>
      GoogleMapService.initialCameraPosition;

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

  getNearbyPlaces() async {
    Logger().i("Getting nearby places ..");
    _loadingPlaces = true;
    rebuildUi();
    _spotsMarkers.clear();
    // _parkingSpots.clear();
    rebuildUi();
    final result = await _parkingSpotService.getNearbyParkingSpots(
      48.8566,
      2.3522,
      8,
    );
    result.match(
      (errorMessage) {
        _toastService.showError(title: errorMessage);
      },
      (parkingSpots) {
        _parkingSpots.addAll(parkingSpots);
        // spotsMarkers = parkingSpots.map((spot) {
        //   return Marker(
        //     markerId: MarkerId(spot.id.toString()),
        //     position: LatLng(spot.latitude, spot.longitude),
        //     icon: AssetMapBitmap("assets/images/Map_pin.png"),
        //     infoWindow: InfoWindow(snippet: spot.address),
        //   );
        // }).toList();

        // Fake places for testing
        // _spotsMarkers.addAll([
        // Marker(
        //   markerId: const MarkerId('eiffel_tower'),
        //   position: const LatLng(48.8584, 2.2945),
        //   icon: AssetMapBitmap("assets/images/Map_pin.png"),
        //   onTap: () {
        //     // _bottomSheetService.showBottomSheet(
        //     //   context: context,
        //     //   builder: (context) => const ParkingSpotDetailsBottomSheet(),
        //     // );
        //   },
        // ),
        // Marker(
        //   markerId: const MarkerId('louvre_museum'),
        //   position: const LatLng(48.8606, 2.3376),
        //   icon: AssetMapBitmap("assets/images/Map_pin.png"),

        //   infoWindow: const InfoWindow(
        //     title: 'Louvre Museum',
        //     snippet: 'Rue de Rivoli, 75001 Paris, France',
        //   ),
        // ),
        // Marker(
        //   markerId: const MarkerId('notre_dame'),
        //   position: const LatLng(48.8529, 2.3499),
        //   icon: AssetMapBitmap("assets/images/Map_pin.png"),
        //   infoWindow: const InfoWindow(
        //     title: 'Notre Dame Cathedral',
        //     snippet:
        //         '6 Parvis Notre-Dame - Pl. Jean-Paul II, 75004 Paris, France',
        //   ),
        // ),
        // Marker(
        //   markerId: const MarkerId('arc_de_triomphe'),
        //   position: const LatLng(48.8738, 2.2950),
        //   icon: AssetMapBitmap("assets/images/Map_pin.png"),

        //   infoWindow: const InfoWindow(
        //     title: 'Arc de Triomphe',
        //     snippet: 'Place Charles de Gaulle, 75008 Paris, France',
        //   ),
        // ),
        // Marker(
        //   markerId: const MarkerId('sacre_coeur'),
        //   position: const LatLng(48.8867, 2.3431),
        //   icon: AssetMapBitmap("assets/images/Map_pin.png"),

        //   infoWindow: const InfoWindow(
        //     title: 'Sacre-Cœur Basilica',
        //     snippet: '35 Rue du Chevalier de la Barre, 75018 Paris, France',
        //   ),
        // ),
        // ]);
        rebuildUi();

        var spotsMarkers = parkingSpots.map((spot) {
          return Marker(
            markerId: MarkerId(spot.id.toString()),
            position: LatLng(spot.latitude, spot.longitude),
            icon: AssetMapBitmap("assets/images/Map_pin.png"),
            // infoWindow: InfoWindow(snippet: spot.address),
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
    _loadingPlaces = false;
    rebuildUi();
  }

  void initHome() async {
    await _checkLocationService();
    if (!_isLocationServiceEnabled) return;
    // TODO: check if user has a location permission first
    await goToCurrentLocation();

    getNearbyPlaces();
  }

  Future<void> goToCurrentLocation() async {
    final result = await _locationService.getCurrentLocation();
    await result.match(
      (error) async {
        _logger.e('Failed to get current location: $error');
      },
      (location) async {
        _animateToCameraPosition(
          CameraPosition(
            target: LatLng(location.latitude, location.longitude),
            zoom: 15,
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
  List<ListenableServiceMixin> get listenableServices => [_userService];
}
