import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/app/app.logger.dart';
import 'package:kreyno/dtos/update_car_dto.dart';
import 'package:kreyno/enums/vehicle_type.dart';
import 'package:kreyno/models/car.dart';
import 'package:kreyno/models/get_car_by_registration_response.dart';
import 'package:kreyno/services/cars_service.dart';
import 'package:kreyno/services/toast_service.dart';
import 'package:kreyno/ui/common/app_strings.dart';
import 'package:kreyno/ui/views/edit_vehicule/edit_vehicule_view.form.dart'
    show ValueProperties, Methods;
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class EditVehiculeViewModel extends FormViewModel {
  final _logger = getLogger('EditVehiculeViewModel');
  final _navigationService = locator<NavigationService>();
  final _carsService = locator<CarsService>();
  final _toastService = locator<ToastService>();

  Car? _car;
  Car? get car => _car;

  String? _licensePlate;
  String? get licensePlate => _licensePlate;
  bool get _hasLicensePlate => _licensePlate?.isNotEmpty ?? false;

  VehicleType? _vehicleType;
  VehicleType? get vehicleType => _vehicleType;

  String? _vehicleImageUuid;
  String? get vehicleImageUuid => _vehicleImageUuid;

  bool _isUploadingImage = false;
  bool get isUploadingImage => _isUploadingImage;

  bool _isLoadingLicensePlate = false;
  bool get isLoadingLicensePlate => _isLoadingLicensePlate;

  bool get isFormValid =>
      (hasBrand &&
          hasModel &&
          hasColor &&
          hasCo2Emission &&
          _hasLicensePlate &&
          _vehicleType != null) &&
      (hasBrandValidationMessage == false &&
          hasModelValidationMessage == false &&
          hasColorValidationMessage == false &&
          hasCo2EmissionValidationMessage == false) &&
      !_isUploadingImage &&
      !_isLoadingLicensePlate;

  void initialize(Car car) {
    _car = car;
    _licensePlate = car.registrationNumber;
    _vehicleType = car.vehicleType;
    _vehicleImageUuid = car.image?.id.toString();
    // Initialize form fields
    brandValue = car.brand;
    modelValue = car.model;
    colorValue = car.color;
    co2EmissionValue = car.co2Emission?.toString() ?? '';

    rebuildUi();
  }

  void onLicensePlateValidated(String licensePlate) {
    _licensePlate = licensePlate;
    rebuildUi();
  }

  void onCarDataChanged(GetCarByRegistrationResponse? carData) {
    if (carData != null) {
      brandValue = carData.brand;
      modelValue = carData.model;
      colorValue = carData.color;
      co2EmissionValue = carData.co2Emission;
    } else {
      clearForm();
    }
    rebuildUi();
  }

  void onLicensePlateLoadingChanged(bool isLoading) {
    setBusy(isLoading);
    _isLoadingLicensePlate = isLoading;
    rebuildUi();
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

  Future<void> onSaveTapped() async {
    if (!isFormValid || _car == null) {
      return;
    }
    setBusy(true);
    try {
      final response = await _carsService.updateCar(
        _car!.id!,
        UpdateCarDto(
          vehicleType: vehicleType,
          brand: brandValue,
          model: modelValue,
          color: colorValue,
          isSelected: car!.isSelected,
          co2Emission: co2EmissionValue,
          registrationNumber: licensePlate,
          imageUuid: _vehicleImageUuid,
        ),
      );

      await response.match(
        (error) async {
          _logger.e(error);
          _toastService.showError(title: error, showIcon: true);
        },
        (car) async {
          _logger.i('Vehicle updated: ${car.registrationNumber}');
          _toastService.showSuccess(
            title: EditVehiculeStrings.vehicleUpdatedSuccessfully,
          );
          _navigationService.back(result: true);
        },
      );
    } finally {
      setBusy(false);
    }
  }
}
