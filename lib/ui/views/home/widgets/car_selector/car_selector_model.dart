import 'package:flutter/material.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/app/app.logger.dart';
import 'package:kreyno/models/car.dart';
import 'package:kreyno/models/user.dart';
import 'package:kreyno/services/cars_service.dart';
import 'package:kreyno/services/toast_service.dart';
import 'package:stacked/stacked.dart';

class CarSelectorModel extends BaseViewModel {
  final _logger = getLogger('CarSelectorModel');
  final _carsService = locator<CarsService>();
  final _toastService = locator<ToastService>();
  final googleSearchController = TextEditingController();
  final Function(SelectedCar) onSelectedCarChanged;
  CarSelectorModel({required this.onSelectedCarChanged});

  final OverlayPortalController controller = OverlayPortalController();

  List<Car> _cars = [];
  List<Car> get cars => _cars;

  bool _isListVisible = false;
  bool get isListVisible => _isListVisible;

  bool _settingDefaultCar = false;
  bool get isSettingDefaultCar => _settingDefaultCar;

  int _tappedCarId = 1_000_000;
  int get tappedCarId => _tappedCarId;

  void setTappedCarId(int carId) {
    _tappedCarId = carId;
    rebuildUi();
  }

  void setIsSettingDefaultCar(bool value) {
    _settingDefaultCar = value;
    rebuildUi();
  }

  void setIsListVisible(bool value) {
    _isListVisible = value;
    rebuildUi();
  }

  void setCars(List<Car> cars) {
    _cars = cars;
    rebuildUi();
  }

  void showCarListOverlay() async {
    if (controller.isShowing) return;
    setError(null);
    setCars([]);
    controller.show();
    await Future.delayed(const Duration(milliseconds: 50), () {
      setIsListVisible(true);
    });
    await getAllCars();
  }

  void hideCarListOverlay() async {
    if (!controller.isShowing) return;
    setIsListVisible(false);
    await Future.delayed(const Duration(milliseconds: 600), () {
      controller.hide();
    });
  }

  void selectCar(int carId) async {
    setIsSettingDefaultCar(true);
    setTappedCarId(carId);
    try {
      final response = await _carsService.setDefaultCar(carId);
      response.match(
        (error) {
          _logger.e('Error selecting car', error: error);
          _toastService.showError(title: error);
        },
        (car) {
          setCars(
            cars.map((c) => c.copyWith(isSelected: c.id == car.id)).toList(),
          );
          onSelectedCarChanged(
            SelectedCar(
              brand: car.brand,
              model: car.model,
              color: car.color,
              registrationNumber: car.registrationNumber,
              image: car.image,
            ),
          );
          hideCarListOverlay();
        },
      );
    } finally {
      setIsSettingDefaultCar(false);
      setTappedCarId(1_000_000);
    }
  }

  Future<void> getAllCars() async {
    setError(null);
    setBusy(true);
    try {
      final allCarsResponse = await _carsService.getAllCars();
      await allCarsResponse.match(
        (error) async {
          _logger.e('Error fetching all cars', error: error);
          setError(error);
        },
        (cars) async {
          setCars(cars);
        },
      );
    } finally {
      setBusy(false);
    }
  }
}
