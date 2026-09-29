import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/app/app.logger.dart';
import 'package:kreyno/app/app.router.dart';
import 'package:kreyno/dtos/create_car_dto.dart';
import 'package:kreyno/enums/onboarding_step.dart';
import 'package:kreyno/enums/vehicle_type.dart';
import 'package:kreyno/models/get_car_by_registration_response.dart';
import 'package:kreyno/services/analytics_service.dart';
import 'package:kreyno/services/cars_service.dart';
import 'package:kreyno/services/onboarding_service.dart';
import 'package:kreyno/services/toast_service.dart';
import 'package:kreyno/ui/common/app_strings.dart';
import 'package:kreyno/ui/views/set_up_vehicule/set_up_vehicule_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SetUpVehiculeViewModel extends FormViewModel {
  final _logger = getLogger('SetUpVehiculeViewModel');
  final _navigationService = locator<NavigationService>();
  final _carsService = locator<CarsService>();
  final _analyticsService = locator<AnalyticsService>();
  final _toastService = locator<ToastService>();
  final _onboardingService = locator<OnboardingService>();

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

  void onLicensePlateValidated(String licensePlate) {
    _licensePlate = licensePlate;
    rebuildUi();
  }

  void onCarDataChanged(GetCarByRegistrationResponse? carData) {
    if (carData != null) {
      brandValue = carData.brand;
      modelValue = carData.model;
      colorValue = carData.color;
      co2EmissionValue = carData.co2Emission.toString();
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
    _toastService.showInfo(
      title: SetUpVehiculeStrings.saveVehicleToMoveToNextStep,
      showIcon: true,
    );
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
    if (!isFormValid) {
      return;
    }
    setBusy(true);
    try {
      final response = await _carsService.createCar(
        CreateCarDto(
          vehicleType: vehicleType!,
          brand: brandValue!,
          model: modelValue!,
          color: colorValue!,
          co2Emission: co2EmissionValue!,
          registrationNumber: licensePlate!,
          imageUuid: _vehicleImageUuid,
          isSelected: true,
        ),
      );

      await response.match(
        (error) async {
          _logger.e(error);
          _toastService.showError(title: error, showIcon: true);
        },
        (car) async {
          _logger.i('Vehicle created: ${car.registrationNumber}');
          // Funnel step 4. This step has no skip: a vehicle is required.
          await _analyticsService.vehicleStepCompleted();
          _toastService.showSuccess(
            title: SetUpVehiculeStrings.vehiculeSavedSuccessfully,
          );
          final onboardingResult = await _onboardingService.setCurrentStep(
            OnboardingStep.completed,
          );
          await onboardingResult.match(
            (error) async {
              _logger.e('Error initializing onboarding flow', error: error);
            },
            (_) async {
              await _navigationService.replaceWithSetUpPaymentMethodsView();
            },
          );
        },
      );
    } finally {
      setBusy(false);
    }
  }
}
