import 'package:flutter/widgets.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/app/app.logger.dart';
import 'package:kreyno/models/get_car_by_registration_response.dart';
import 'package:kreyno/services/cars_service.dart';
import 'package:stacked/stacked.dart';

class LicensePlateInputModel extends BaseViewModel {
  final _logger = getLogger('LicensePlateInputModel');
  final _carsService = locator<CarsService>();

  final Function(String licensePlate)? onLicensePlateValidated;
  final Function(GetCarByRegistrationResponse? carData)? onCarDataChanged;
  final Function(bool isLoading)? onLoadingStateChanged;

  LicensePlateInputModel({
    required this.onLicensePlateValidated,
    required this.onCarDataChanged,
    required this.onLoadingStateChanged,
  });

  final TextEditingController _controller = TextEditingController();
  TextEditingController get controller => _controller;

  final FocusNode _focusNode = FocusNode();
  FocusNode get focusNode => _focusNode;

  bool _isFrenchLicensePlate = true;
  bool get isFrenchLicensePlate => _isFrenchLicensePlate;

  bool _isLoadingCarData = false;
  bool get isLoadingCarData => _isLoadingCarData;

  String? _validatedLicensePlate;
  String? get validatedLicensePlate => _validatedLicensePlate;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  GetCarByRegistrationResponse? _fetchedCarData;
  GetCarByRegistrationResponse? get fetchedCarData => _fetchedCarData;

  void toggleLicensePlateType(bool isFrench) {
    _isFrenchLicensePlate = isFrench;
    reset();
    onCarDataChanged?.call(null);
    rebuildUi();
  }

  void onTextChanged(String value) {
    clearError();

    final cleanPlate = value.replaceAll(' - ', '');

    if (cleanPlate.length == 7) {
      _validatedLicensePlate = cleanPlate;
      _focusNode.unfocus();
      onLicensePlateValidated?.call(cleanPlate);

      if (_isFrenchLicensePlate) {
        _fetchCarDataByRegistration();
      }
    } else {
      _validatedLicensePlate = null;
    }

    rebuildUi();
  }

  Future<void> _fetchCarDataByRegistration() async {
    _isLoadingCarData = true;
    _errorMessage = null;
    onLoadingStateChanged?.call(true);
    rebuildUi();

    final response = await _carsService.getCarByRegistrationNumber(
      _validatedLicensePlate!,
    );

    response.match(
      (error) {
        _logger.e('Error fetching car data', error: error);
        _errorMessage = error;
        _fetchedCarData = null;
        onCarDataChanged?.call(null);
      },
      (carData) {
        _logger.i('Car data fetched successfully');
        _fetchedCarData = carData;
        _errorMessage = null;
        onCarDataChanged?.call(carData);
      },
    );

    _isLoadingCarData = false;
    onLoadingStateChanged?.call(false);
    rebuildUi();
  }

  void clearError() {
    if (_errorMessage != null) {
      _errorMessage = null;
      rebuildUi();
    }
  }

  void reset() {
    _controller.clear();
    _validatedLicensePlate = null;
    _errorMessage = null;
    _fetchedCarData = null;
    _isLoadingCarData = false;
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }
}
