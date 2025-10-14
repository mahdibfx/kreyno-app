import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/app/app.logger.dart';
import 'package:kreyno/app/app.router.dart';
import 'package:kreyno/models/car.dart';
import 'package:kreyno/services/cars_service.dart';
import 'package:kreyno/services/toast_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

// pagination was not implemented dues to the time constraint
class MyVehiculesViewModel extends BaseViewModel {
  final _logger = getLogger('MyVehiculesViewModel');
  final _navigationService = locator<NavigationService>();
  final _carsService = locator<CarsService>();
  final _toastService = locator<ToastService>();

  List<Car> _cars = [];
  List<Car> get cars => _cars;

  bool _actionInProgress = false;
  bool get actionInProgress => _actionInProgress;

  void setActionInProgress(bool value) {
    _actionInProgress = value;
    rebuildUi();
  }

  void setCars(List<Car> cars) {
    _cars = cars;
    rebuildUi();
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

  void goBack() {
    _navigationService.back();
  }

  void onAddNewVehicleTapped() async {
    final result = await _navigationService.navigateToAddVehiculeView();
    if (result != null && result is Car) {
      setCars([...cars, result]);
    }
  }

  void onSetDefaultCarTapped(int carId) async {
    final previousCars = List<Car>.from(cars);

    setCars(
      cars
          .map(
            (listCar) => listCar.id == carId
                ? listCar.copyWith(isSelected: true)
                : listCar.copyWith(isSelected: false),
          )
          .toList(),
    );

    final result = await _carsService.setDefaultCar(carId);
    await result.match(
      (error) async {
        _logger.e('Error setting default car', error: error);
        setCars(previousCars);
        _toastService.showError(title: error, showIcon: true);
      },
      (car) async {
        setCars(
          cars
              .map(
                (listCar) => listCar.id == carId
                    ? car
                    : listCar.copyWith(isSelected: false),
              )
              .toList(),
        );
      },
    );
  }
}
