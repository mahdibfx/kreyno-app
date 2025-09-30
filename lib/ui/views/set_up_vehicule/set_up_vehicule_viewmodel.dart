import 'package:flutter/widgets.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/app/app.logger.dart';
import 'package:kreyno/enums/vehicle_type.dart';
import 'package:kreyno/services/cars_service.dart';
import 'package:kreyno/services/toast_service.dart';
import 'package:kreyno/ui/views/set_up_vehicule/set_up_vehicule_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

// TODO: implement the logic to setup the vehicule
// TODO: implement the logic to resume the setup vehicule
class SetUpVehiculeViewModel extends FormViewModel {
  final _logger = getLogger('SetUpVehiculeViewModel');
  final _navigationService = locator<NavigationService>();
  final _carsService = locator<CarsService>();
  final _toastService = locator<ToastService>();

  final TextEditingController licensePlateController = TextEditingController();

  bool _isFrenchLicensePlate = true;
  bool get isFrenchLicensePlate => _isFrenchLicensePlate;

  String? _licensePlate;
  String? get licensePlate => _licensePlate;
  bool get _hasLicensePlate => _licensePlate?.isNotEmpty ?? false;

  VehicleType? _vehicleType;
  VehicleType? get vehicleType => _vehicleType;

  String? _licensePlateError;
  String? get licensePlateError => _licensePlateError;

  String? _vehicleImageUuid;
  String? get vehicleImageUuid => _vehicleImageUuid;

  bool _isUploadingImage = false;
  bool get isUploadingImage => _isUploadingImage;

  bool get isFormValid =>
      (hasBrand &&
          hasModel &&
          hasColor &&
          hasCo2Emission &&
          _hasLicensePlate) &&
      (hasBrandValidationMessage == false &&
          hasModelValidationMessage == false &&
          hasColorValidationMessage == false &&
          hasCo2EmissionValidationMessage == false) &&
      !_isUploadingImage;

  void setIsFrenchLicensePlate(bool value) {
    _isFrenchLicensePlate = value;
    licensePlateController.clear();
    clearForm();
    setLicensePlateError(null);
  }

  void setLicensePlateError(String? value) {
    _licensePlateError = value;
    rebuildUi();
  }

  void onLicensePlateCompleted(String value) async {
    _licensePlate = value;
    setLicensePlateError(null);
    if (isFrenchLicensePlate) {
      setBusy(true);
      final response = await _carsService.getCarByRegistrationNumber(
        _licensePlate!,
      );
      response.match(
        (error) {
          _logger.e(error);
          setLicensePlateError(error);
          clearForm();
        },
        (carInfo) {
          brandValue = carInfo.brand;
          modelValue = carInfo.model;
          colorValue = carInfo.color;
          co2EmissionValue = carInfo.co2Emission;
        },
      );
      setBusy(false);
    }
  }

  void setVehicleType(VehicleType value) {
    _vehicleType = value;
    rebuildUi();
  }

  void goBack() {
    _navigationService.back();
  }

  void onImageUploadSuccess(String uuid) {
    _vehicleImageUuid = uuid;
    _logger.i('Image uploaded successfully: $uuid');
    rebuildUi();
  }

  void onImageUploadFailure(String error) {
    _logger.e('Image upload failed: $error');
    _toastService.showError(title: error, showIcon: true);
    rebuildUi();
  }

  void onImageUploading(bool isUploading) {
    _isUploadingImage = isUploading;
    _logger.i('Image uploading: $isUploading');
    rebuildUi();
  }

  void onImageDeleteSuccess() {
    _vehicleImageUuid = null;
    _logger.i('Image deleted successfully');
    rebuildUi();
  }

  void onImageDeleteFailure(String error) {
    _logger.e('Image delete failed: $error');
    _toastService.showError(title: error, showIcon: true);
    rebuildUi();
  }

  Future<void> onContinueTapped() async {
    _logger.i('Setting up vehicle');
    // TODO: Uncomment when backend is ready
    // setBusy(true);
    // final response = await _carsService.createCar(
    //   CreateCarDto(
    //     vehicleType: vehicleType!,
    //     brand: brandValue!,
    //     model: modelValue!,
    //     color: colorValue ?? '',
    //     co2Emission: co2EmissionValue ?? '',
    //     registrationNumber: licensePlate!,
    //     imageUuid: _vehicleImageUuid!, // Add the image UUID here
    //     isSelected: true,
    //   ),
    // );
    // response.match(
    //   (error) {
    //     _logger.e(error);
    //     _toastService.showError(title: error, showIcon: true);
    //   },
    //   (car) {
    //     _logger.i('Vehicle created: ${car.registrationNumber}');
    //   },
    // );
    // setBusy(false);
  }
}
