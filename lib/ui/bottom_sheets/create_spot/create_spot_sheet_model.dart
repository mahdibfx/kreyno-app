import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/app/app.logger.dart';
import 'package:kreyno/app/app.router.dart';
import 'package:kreyno/dtos/create_parking_spot_dto.dart';
import 'package:kreyno/services/location_service.dart';
import 'package:kreyno/services/parking_spots_service.dart';
import 'package:kreyno/services/toast_service.dart';
import 'package:kreyno/ui/views/my_let_place/my_let_place_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:string_validator/string_validator.dart';

class CreateSpotSheetModel extends ReactiveViewModel {
  final _logger = getLogger('CreateSpotSheetModel');

  final _locationService = locator<LocationService>();
  final _navigationService = locator<NavigationService>();

  final _toastService = locator<ToastService>();

  final placeController = TextEditingController();
  final priceController = TextEditingController();
  final _parkingSpotsService = locator<ParkingSpotsService>();

  bool bornDisponible = true;
  LatLng? spotLatLng;
  String? address;

  choosePlaceInputClicked() async {
    final (String, LatLng)? result = await _navigationService
        .navigateToChooseSellingPlaceLocationView();

    if (result != null) {
      placeController.text = result.$1;
      spotLatLng = result.$2;
      address = result.$1;
      notifyListeners();
    }
  }

  changedBorneValue(bool value) {
    bornDisponible = value;
    notifyListeners();
  }

  bool isLocationEnabled = false;
  checkIfLocationEnabled() async {
    final result = await _locationService.isLocationServiceEnabled();
    isLocationEnabled = result.isRight();
    notifyListeners();
  }

  useMyPosition() async {
    final myPosition = await _locationService.getCurrentLocation();
    if (myPosition.isRight()) {
      myPosition.match((error) {}, (myPositionValue) async {
        final result = await _locationService.getPlaceFromCoordinates(
          LatLng(myPositionValue.latitude, myPositionValue.longitude),
        );

        result.match((error) {}, (placeName) {
          placeController.text = placeName;
          address = placeName;
          spotLatLng = LatLng(
            myPositionValue.latitude,
            myPositionValue.longitude,
          );
          notifyListeners();
        });
      });
    }
  }

  void onEnableButtonClicked() async {
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
        isLocationEnabled = isOpened;
        rebuildUi();
      },
    );
  }

  bool validateCreateSpotButton() {
    return placeController.text.isNotEmpty &&
        priceController.text.isNotEmpty &&
        spotLatLng != null &&
        address != null;
  }

  Future<void> letMyPlaceButtonClicked() async {
    // _navigationService.navigateToMyLetPlaceView();
    // return;
    setBusy(true);
    final result = await _parkingSpotsService.createParkingSpot(
      CreateParkingSpotDto(
        latitude: spotLatLng!.latitude,
        longitude: spotLatLng!.longitude,
        address: address!,
        price: priceController.text.toDouble(),
        electricChargeStation: bornDisponible,
      ),
    );
    result.match(
      (error) {
        _logger.e('Failed to create parking spot: $error');
        _toastService.showError(
          title: 'Failed to create parking spot',
          description: error,
        );
      },
      (success) {
        _toastService.showSuccess(title: 'Parking spot created successfully');
        _navigationService.navigateToView(
          const MyLetPlaceView(),
          arguments: success,
        );
        // _navigationService.back();
      },
    );

    setBusy(false);
  }
}
