import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/app/app.logger.dart';
import 'package:kreyno/models/car.dart';
import 'package:kreyno/services/cars_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

// pagination was not implemented dues to the time constraint
class MyVehiculesViewModel extends BaseViewModel {
  final _logger = getLogger('MyVehiculesViewModel');
  final _navigationService = locator<NavigationService>();
  final _carsService = locator<CarsService>();

  List<Car> _cars = [];
  List<Car> get cars => _cars;

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
}
