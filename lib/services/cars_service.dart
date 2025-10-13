import 'package:fpdart/fpdart.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/dtos/create_car_dto.dart';
import 'package:kreyno/extensions/api_response_extensions.dart';
import 'package:kreyno/models/car.dart';
import 'package:kreyno/models/get_car_by_registration_response.dart';
import 'package:kreyno/services/api/api_car_service.dart';
import 'package:kreyno/services/api/dio_service.dart';

class CarsService {
  final _apiCarService = ApiCarService(locator<DioService>().dio);

  Future<Either<String, GetCarByRegistrationResponse>>
  getCarByRegistrationNumber(String registrationNumber) {
    return _apiCarService
        .getCarByRegistrationNumber(registrationNumber)
        .toEither();
  }

  Future<Either<String, Car>> createCar(CreateCarDto carDto) {
    return _apiCarService.createCar(carDto).toEither();
  }

  Future<Either<String, List<Car>>> getAllCars() {
    return _apiCarService.getAllCars().toEither();
  }
}
