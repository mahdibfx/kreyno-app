import 'package:dio/dio.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/app/app.router.dart';
import 'package:kreyno/models/car.dart';
import 'package:kreyno/services/cars_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class MyVehiculesViewModel extends BaseViewModel {
  int principlaCarId = 0;
  final _carsService = locator<CarsService>();
  final List<Car> myCarsList = [];
  getMyVehicules() async {
    try {
      final result = await _carsService.getMyCars();
      if (result.success) {
        myCarsList.addAll(result.data);
      } else {
// handle backend errors
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError) {
        //TO:DO this for internet error screen , i saw fateh did some specific error screens
      }
    } catch (e) {
      //TO:DO this for generalized error screen
    }
  }

  Future<void> setPrincipalCar(int carId) async {
    setBusy(true);
    try {
      final result = await _carsService.setDefaultCar(carId);
      if (result != null) {
        principlaCarId = carId;
        notifyListeners();
      }
    } catch (e) {
      // TODO: handle errors
    } finally {
      setBusy(false);
    }
  }

  onMenuTap(String result, int carId) {
    if (result == 'p') {
      setPrincipalCar(carId);
      notifyListeners();
    }
    if (result == 'm') {
      //edit
      locator<NavigationService>().navigateToModifyVehiculeView();
    }

    if (result == "d") {
      _carsService.deleteCar(carId);
    }
  }
}
